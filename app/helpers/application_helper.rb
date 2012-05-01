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
  
  def publication_issues_path(descriptor)
    "/issues/#{descriptor}"
  end
  
  def issue_name(issue)
    month = Date::MONTHNAMES[issue.publication_date.month] unless issue.publication_date == nil
    year = issue.publication_date.year unless issue.publication_date == nil
    issue.nil? ? "N/A" : "Issue #{issue.volume}.#{issue.issue_number} #{month} #{year}"
  end
  
  def link_to_remove_partial(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_partial(this)")
  end
  
  def link_to_add_partial(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    partial = ''
    f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
       partial = render(association.to_s.singularize + "_partial", :f => builder)
    end
    link_to_function(name, "add_partial(this, \"#{association}\", \"#{escape_javascript(partial)}\")")
  end
  
end
