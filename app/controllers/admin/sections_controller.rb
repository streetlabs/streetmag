class Admin::SectionsController < ApplicationController
  before_filter :authenticate_user!
  force_ssl
  load_and_authorize_resource
  
  # GET /sections
  # GET /sections.xml
  def index
    @publication = Publication.find(params[:publication_id])
    @sections = @publication.sections.order("sections.position ASC")
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.find(params[:id])
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @publication = Publication.find(params[:publication_id])
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.find(params[:id])
  end

  def create
    
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.create(params[:section])

    if @section.save
      redirect_to(admin_publication_admin_sections_path(@publication), :notice => 'Section was successfully created.')
    else
      render :action => "new" 
    end

  end

  def update
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.find(params[:id])

    if @section.update_attributes(params[:section])
      redirect_to( admin_publication_admin_section_path(@publication, @section), :notice => 'Issue was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @section = @publication.sections.find(params[:id])
    @section.destroy

     redirect_to admin_publication_admin_sections_path(@publication)
  end
  

end
