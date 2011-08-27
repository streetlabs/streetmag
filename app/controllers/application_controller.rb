class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  force_ssl
  before_filter :determine_website
  before_filter :mailer_set_url_options
  before_filter :current_publication

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403
  end

  private
  def determine_website
    name = request.subdomain
    name.present? && name != 'www' && name != 'api' ? @website_publication = Publication.find_by_name!(name) :  @website_publication = nil
  end
  
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end  
  
  def current_publication  
    @current_publication ||= Publication.find(params[:publication_id]) if params[:publication_id]
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_user, current_publication)
  end
  
  
end
