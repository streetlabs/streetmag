class SitePagesController < ApplicationController
  load_and_authorize_resource
  layout "subdomain"

  def index
    @publication= Publication.find_by_name!(request.subdomain)
    @site_pages = @publication.site_pages
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @site_page = @publication.site_pages.find(params[:id])
  end
  
end
