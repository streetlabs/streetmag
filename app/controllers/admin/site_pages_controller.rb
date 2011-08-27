class Admin::SitePagesController < ApplicationController
  before_filter :authenticate_user!
  force_ssl
  load_and_authorize_resource

  # GET /site_pages
  # GET /site_pages.xml
  def index
    @publication = Publication.find(params[:publication_id])
    @site_pages = @publication.site_pages
  end

  def show
    @publication = Publication.find(params[:publication_id])
    @site_page = @publication.site_pages.find(params[:id])
  end


  def new
    @publication = Publication.find(params[:publication_id])
    @site_page = SitePage.new
  end

  def edit
    @publication = Publication.find(params[:publication_id])
    @site_page = @publication.site_pages.find(params[:id])
  end

  def create

    @publication = Publication.find(params[:publication_id])
    @site_page = @publication.site_pages.create(params[:site_page])

    if @site_page.save
      redirect_to(admin_publication_admin_site_pages_path(@publication), :notice => 'Site Page was successfully created.')
    else
      render :action => "new" 
    end

  end

  def update
    @publication = Publication.find(params[:publication_id])
    @site_page = @publication.site_pages.find(params[:id])

    if @site_page.update_attributes(params[:site_page])
      redirect_to( admin_publication_admin_site_page_path(@publication, @site_page), :notice => 'Site Page was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @site_page = @publication.site_pages.find(params[:id])
    @site_page.destroy

     redirect_to admin_publication_admin_site_pages_path(@publication)
  end
end
