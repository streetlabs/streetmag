class Admin::AuthorsController < ApplicationController
  before_filter :authenticate_user!
  force_ssl
  load_and_authorize_resource

  # GET /authors
  def index
    @publication = @current_publication
    @authors = @publication.authors.order("name ASC")
  end

  # GET /authors/1
  def show
    @publication = @current_publication
    @author = @publication.authors.find(params[:id])
  end

  # GET /authors/new
  def new
    @publication = @current_publication
    @author = @publication.authors.new
  end

  # GET /authors/1/edit
  def edit
    @publication = @current_publication
    @author = @publication.authors.find(params[:id])
  end

  # POST /authors
  def create
    @publication = @current_publication
    @author= @publication.authors.create(params[:author])
    if @author.save
      redirect_to(admin_publication_admin_authors_path(@publication), :notice => 'Author was successfully created.')
    else
        render :action => "new"
    end

  end


  # PUT /authors/1
  def update
    @publication = @current_publication
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to( admin_publication_admin_author_path(@publication, @author), :notice => 'Author was successfully updated.')
    else
      render :action => "edit" 
    end
    
  end

  # DELETE /authors/1
  def destroy
    @publication = @current_publication
    @author = @publication.authors.find(params[:id])
    @author.destroy
    
    redirect_to admin_publication_admin_authors_path(@publication)
  end
end
