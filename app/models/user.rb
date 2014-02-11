class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  before_validation :nullify_blanks

  validates :name, :presence => true

  validate :unique_email
  validate :position_exists

  has_many :roles
  has_many :semesters, through: :roles

  accepts_nested_attributes_for :roles

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/users/:style/:id/:filename",
    :styles => {
      medium: "400px>",
      small: "200px>",
      profile: "100px>"
    },
    :convert_options => {
      profile: "-quality 75 -strip"
    },
    :default_url => "member.png"

  def image_path
    file_name = self.name.downcase.split.join('_')
    return "/images/members/" + file_name + ".jpg"
  end

  def current_position
    if role_for_current_semester.nil?
      "Project Member"
    else
      role_for_current_semester.name
    end
  end

  def position_type
    User.positions_by_type.select {|k,v| v.include?(self.current_position)}.first.first
  end

  def self.positions
    User.positions_by_type.values.flatten
  end

  def set_roles(params)
    @user = User.find(params[:id])
    params[:user][:roles_attributes].each do |id, role|
      @user.add_role_for_semester(Position.find_by_name(role["name"]), Semester.find(role["semester_id"]))
    end
  end

  def create_temp_roles
    semesters = Semester.all - Semester.where(id: roles.pluck(:semester_id))
    semesters.each do |semester|
      self.roles.build(semester_id: semester.id)
    end
  end

  # Roles
  def add_role_for_semester(position, semester)
    if role_for_semester(semester).nil?
      self.roles.create(user_type: position.user_type, name: position.name, semester_id: semester.id)
    else
      user_role = self.roles.find_by_semester_id(semester.id)
      user_role.update(name: position.name, user_type: position.user_type)
      user_role.save
    end
  end

  def role_for_semester(semester)
    self.roles.find_by_semester_id(semester.id)
  end

  def role_for_current_semester
    self.role_for_semester(Semester.current)
  end

  def is_admin
    unless role_for_current_semester.nil?
      (User.positions_by_type["exec"] + User.positions_by_type["pl"]).include? role_for_current_semester.name
    else
      false
    end
  end

  def is_alumni
    self.current_position == "Alumnus"
  end

  protected
  def nullify_blanks
    attributes.each do |col, val|
      # dont' use blank? because false is blank
      self[col] = nil if self[col].nil? or self[col] == ""
    end
  end

  def unique_email
    users_with_same_email = User.where("email = ? OR facebook_id = ?", self.email, self.email)
    users_with_same_email.each do |u|
      unless u == self
        errors.add(:email, "Someone is already using this e-mail!")
      end
    end
    unless facebook_id.nil?
      users_with_same_facebook_id = User.where("email = ? OR facebook_id = ?", self.facebook_id, self.facebook_id)
      users_with_same_facebook_id.each do |u|
        unless u == self
          errors.add(:email, "Someone is already using this Facebook ID!")
        end
      end
    end
  end

  def position_exists
    unless User.positions.include?(self.current_position)
      errors.add(:position, 'A valid position must be given!')
    end
  end

  def self.positions_by_type
    return {
      'exec' => User.current_positions['exec'] + User.deprecated_positions['exec'],
      'pl' => User.current_positions['pl'],
      'member' => User.current_positions['member'],
      'chair' => User.current_positions['chair'] + User.deprecated_positions['chair'],
      'faculty' => User.current_positions['faculty'],
      'alumni' => User.deprecated_positions['alumni'],
      'nonmember' => User.deprecated_positions['nonmember'],
    }
  end

  def self.current_positions
    return {
      'exec' => ["President", "VP of Technology", "VP of Projects", "Internal VP", "External VP"],
      'pl' => ["Project Leader"],
      'member' => ["Project Member"],
      'chair' => ["Technology Chair", "Marketing Chair"],
      'faculty' => ["Faculty Advisor"],
    }
  end

  def self.deprecated_positions
    return {
      'exec' => ["VP of Operations", "VP of Marketing & Finance"],
      'chair' => ["External Relations & Events Chair"],
      'alumni' => ["Alumnus"],
      'nonmember' => ["Not a Member"],
    }
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    User.where("email = ? OR facebook_id = ?", data['email'], data['email']).first
  end

  class << self

    def current(user_type)
      user_ids = Role.where(semester_id: Semester.current, user_type: user_type).pluck(:user_id)
      User.where(id: user_ids)
    end

    def current_eteam
      User.current('exec')
    end

    def current_pls
      User.current('pl')
    end

    def current_devs
      User.current('member')
    end

    def current_chairs
      User.current('chair')
    end

    def current_faculty_advisors
      User.current('faculty')
    end

    def current_members
      current_eteam + current_pls + current_devs + current_chairs + current_faculty_advisors
    end

    def alumni
      user_ids = Role.where(semester_id: Semester.current.id, user_type: "alumni").pluck(:user_id)
      User.where(id: user_ids).includes(:roles)
    end

    def copy_existing_roles(semester)
      User.all.each do |user|
        if user.role_for_current_semester.nil?
          user.add_role_for_semester(Position.find_by_name("Project Member"), semester)
        else
          user.add_role_for_semester(Position.find_by_name(user.role_for_current_semester.name), semester)
        end
        user.save
      end
    end

  end
end
