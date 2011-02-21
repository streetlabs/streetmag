class SectionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /sections
  # GET /sections.xml
  def index
    @publication = Publication.find(params[:publication_id])
    @sections = @publication.sections
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.find(params[:id])
  end
  
end