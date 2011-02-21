class Admin::ArrangementsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /arrangements
  def index
    @publication = Publication.find(params[:publication_id])
    @arrangements = @publication.arrangements
  end

  # GET /arrangements/1
  def show
    @publication = Publication.find(params[:publication_id])
    @arrangement = @publication.arrangements.find(params[:id])

  end

  # GET /arrangements/new
  def new
    @publication = Publication.find(params[:publication_id])
    @arrangement = Arrangement.new (:publication => @publication)
  end

  # GET /arrangements/1/edit
  def edit
    @publication = Publication.find(params[:publication_id])
    @arrangement = @publication.arrangements.find(params[:id])
  end

  # POST /arrangements
  def create
    @publication = Publication.find(params[:publication_id])
    @arrangement= @publication.arrangements.create(params[:arrangement])

    if @arrangement.save
      redirect_to(admin_publication_admin_arrangements_path(@publication), :notice => 'Arrangement was successfully created.')
    else
        render :action => "new"
    end

  end


  # PUT /arrangements/1
  def update
    @publication = Publication.find(params[:publication_id])
    @arrangement = @publication.arrangements.find(params[:id])

    if @arrangement.update_attributes(params[:arrangement])
      redirect_to( admin_publication_admin_arrangement_path(@publication, @arrangement), :notice => 'Arrangement was successfully updated.')
    else
      render :action => "edit" 
    end
    
  end

  # DELETE /arrangements/1
  def destroy
    @publication = Publication.find(params[:publication_id])
    @arrangement = @publication.arrangements.find(params[:id])
    @arrangement.destroy
    
    redirect_to admin_publication_admin_arrangements_path(@publication)
  end
end
