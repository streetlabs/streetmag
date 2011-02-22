class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  before_filter :determine_website

  private
  def determine_website
    name = request.subdomain
    name.present? && name != 'www' && name != 'api' ? @website_publication = Publication.find_by_name!(name) :  @website_publication = nil
  end
  
end
