class SectionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  layout "subdomain"
  
  # GET /sections
  # GET /sections.xml
  def index
    @publication = Publication.find_by_name!(request.subdomain)
    @sections = @publication.sections
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @section = @publication.sections.find(params[:id])
  end
  
end