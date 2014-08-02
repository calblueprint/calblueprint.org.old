module ApplicationHelper

  def urlify(text)
    text.gsub(" ", "-").downcase
  end

  def link_unless(condition, url, options=nil, &block)
    unless condition
      content_tag :a, capture(&block), href: url, target: '_blank'
    else
      content_tag_string 'Hello', capture(&block), options
    end
  end

end
