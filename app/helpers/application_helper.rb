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
