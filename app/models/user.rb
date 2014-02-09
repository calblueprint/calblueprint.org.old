class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  before_validation :nullify_blanks

  validates :name, :presence => true

  validate :unique_email
  validate :position_exists

  accepts_nested_attributes_for :roles

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/users/:style/:id/:filename",
    :styles => { :medium => "400px>" },
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
      @user.add_role_for_semester(role["name"], Semester.find(role["resource_id"]))
    end
  end

  def create_temp_roles
    semesters = Semester.all - Semester.where(id: roles.pluck(:resource_id))
    semesters.each do |semester|
      self.roles.build(resource_id: semester.id)
    end
  end

  # Roles
  def add_role_for_semester(role, semester)
    if role_for_semester(semester).nil?
      self.add_role role, semester
    else
      user_role = self.roles.find_by_resource_id(semester.id)
      user_role.name = role
      user_role.save
    end
  end

  def role_for_semester(semester)
    self.roles.find_by_resource_id(semester.id)
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
      'exec' => ["VP of Operations", "VP of Marketing & Finanace"],
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
      users = []
      User.current_positions[user_type].each do |position|
        users += User.with_role(position, Semester.current)
      end
      return users
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
      User.with_role(User.deprecated_positions["alumni"][0], Semester.current)
    end

    def copy_existing_roles(semester)
      User.all.each do |user|
        if user.role_for_current_semester.nil?
          user.add_role_for_semester("Project Member", semester)
        else
          user.add_role_for_semester(user.role_for_current_semester.name, semester)
        end
        user.save
      end
    end

  end
end
