module ApplicationHelper
  # application_helper.rb
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def stylesheet_name(name)
    name.present? && name != 'www' && name != 'api' ? name : :all
  end
  
  def subdomain_name(name)
    name.present? && name != 'www' && name != 'api' ? name : "streetmag"
  end
  
  def subdomain?(name)
    name.present? && name != 'www' && name != 'api'
  end
  
end
