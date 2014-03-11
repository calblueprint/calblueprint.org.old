module ApplicationHelper

  def urlify(text)
    text.gsub(" ", "-").downcase
  end

end
