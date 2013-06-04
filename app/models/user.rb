class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_activated, :is_admin, :is_visible, :name, :position, :year, :major, :site, :is_alumni
  
  validates :name, :presence => true
  
  validate :position_exists
  
  before_validation :nullify_blanks
  
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
end
