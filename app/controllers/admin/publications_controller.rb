class Admin::PublicationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def create
    @publication = Publication.new(params[:publication])
    if @publication.save
      redirect_to(admin_publication_path(@publication), :notice => 'Publication was successfully created.')
    else
      render :action => "new" 
    end
end

  def update
    @publication = Publication.find(params[:id])

    if @publication.update_attributes(params[:publication])
      redirect_to(admin_publication_path(@publication), :notice => 'Publication was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    redirect_to(admin_publications_url) 
  end
  
  private
  def current_publication  
    @current_publication ||= Publication.find(params[:id]) if params[:id]
  end
end
