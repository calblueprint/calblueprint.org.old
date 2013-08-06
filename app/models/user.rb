class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_activated, :is_admin, :is_visible, :name, :position, :year, :major, :site, :is_alumni, :facebook_id, :image

  before_validation :nullify_blanks

  validates :name, :presence => true

  validate :unique_email
  validate :position_exists

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/users/:style/:id/:filename",
    :styles => { :medium => "400px>" },
    :default_url => "/images/member.png"

  def image_path
    file_name = self.name.downcase.split.join('_')
    return "/images/members/" + file_name + ".jpg"
  end

  def position_type
    User.positions_by_type.select {|k,v| v.include?(self.position)}.first.first
  end

  def self.positions
    User.positions_by_type.values.flatten
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
    unless User.positions.include?(self.position)
      errors.add(:position, 'A valid position must be given!')
    end
  end

  def self.positions_by_type
    return {
      'exec' => ["President", "VP of Technology", "VP of Projects", "VP of Operations", "VP of Marketing & Finance"],
      'chair' => ["Technology Chair", "Marketing Chair", "External Relations & Events Chair"],
      'pl' => ["Project Leader"],
      'member' => ["Project Member"],
      'faculty' => ["Faculty Advisor"]
    }
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    User.where("email = ? OR facebook_id = ?", data['email'], data['email']).first
  end
end
