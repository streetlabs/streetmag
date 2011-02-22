class IssuesController < ApplicationController
  load_and_authorize_resource
  layout "subdomain"

  def index
    @publication = Publication.find(params[:publication_id])
    @issues = @publication.issues
  end

  def show
    @publication = Publication.find(params[:publication_id])
    @issue = @publication.issues.find(params[:id])
  end

end
