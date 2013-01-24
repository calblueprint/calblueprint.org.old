class Member < ActiveRecord::Base
  attr_accessible :name, :position, :year, :major, :site

  def image_path
  	file_name = self.name.downcase.split.join('_')
  	return "/images/members/" + file_name + ".jpg"
  end
end
