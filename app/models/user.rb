class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :is_approved, :is_admin
  attr_accessible :name, :position, :year, :major, :site, :is_alumni
  
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
end
