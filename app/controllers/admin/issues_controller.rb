class Admin::IssuesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @publication = Publication.find(params[:publication_id])
    @issues = @publication.issues
  end

  def show
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.find(params[:id])
  end

  # GET /issues/new
  # GET /issues/new.xml
  def new
    @publication = Publication.find(params[:publication_id])
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.find(params[:id])
  end

  # POST /issues
  # POST /issues.xml
  def create
    
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.create(params[:issue])

    if @issue.save
      redirect_to(admin_publication_admin_issues_path(@publication), :notice => 'Issue was successfully created.')
    else
      render :action => "new" 
    end

  end

  # PUT /issues/1
  # PUT /issues/1.xml
  def update
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.find(params[:id])

    if @issue.update_attributes(params[:issue])
      redirect_to( admin_publication_admin_issue_path(@publication, @issue), :notice => 'Issue was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  # DELETE /issues/1
  # DELETE /issues/1.xml
  def destroy
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.find(params[:id])
    @issue.destroy

     redirect_to admin_publication_admin_issues_path(@publication)
  end
end
