class Member < ActiveRecord::Base
  attr_accessible :name, :position, :year, :major, :site

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
