class Admin::AuthorsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /authors
  def index
    @publication = Publication.find(params[:publication_id])
    @authors = @publication.authors.order("name ASC")
  end

  # GET /authors/1
  def show
    @publication = Publication.find(params[:publication_id])
    @author = @publication.authors.find(params[:id])

  end

  # GET /authors/new
  def new
    @publication = Publication.find(params[:publication_id])
    @author= @publication.authors.create()
  end

  # GET /authors/1/edit
  def edit
    @publication = Publication.find(params[:publication_id])
    @author = @publication.authors.find(params[:id])
  end

  # POST /authors
  def create
    @publication = Publication.find(params[:publication_id])
    @author= @publication.authors.create(params[:author])

    if @author.save
      redirect_to(admin_publication_admin_authors_path(@publication), :notice => 'Author was successfully created.')
    else
        render :action => "new"
    end

  end


  # PUT /authors/1
  def update
    @publication = Publication.find(params[:publication_id])
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to( admin_publication_admin_author_path(@publication, @author), :notice => 'Author was successfully updated.')
    else
      render :action => "edit" 
    end
    
  end

  # DELETE /authors/1
  def destroy
    @publication = Publication.find(params[:publication_id])
    @author = @publication.authors.find(params[:id])
    @author.destroy
    
    redirect_to admin_publication_admin_authors_path(@publication)
  end
end
