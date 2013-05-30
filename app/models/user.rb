class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :is_approved, :is_admin
  attr_accessible :name, :position, :year, :major, :site, :is_alumni
  
  validate :position_exists
  
  before_validation :nullify_blanks
  
  protected
  def nullify_blanks
    attributes.each do |col, val|
      self[col] = nil if self[col].blank?
    end
  end
  
  protected
  def position_exists
    unless User.positions.include?(self.position)
      errors.add(:position, 'A valid position must be given!')
    end
  end
  
  def image_path
    file_name = self.name.downcase.split.join('_')
    return "/images/members/" + file_name + ".jpg"
  end

  def position_type
    if ["President", "VP of Technology", "VP of Projects", "VP of Operations", "VP of Marketing & Finance"].include? self.position
      return "exec"
    elsif ["Technology Chair", "Marketing Chair"].include? self.position
      return "chair"
    elsif self.position == "Project Leader"
      return "pl"
    elsif self.position == "Faculty Sponsor"
      return "faculty"
    else
      return "member"
    end
  end
  
  def self.positions
    ["President", "VP of Operations", "VP of Marketing & Finance",
      "VP of Projects", "VP of Technology", "Project Leader", "Project Member",
      "Technology Chair", "Marketing Chair", "Faculty Sponsor"]
  end
end
