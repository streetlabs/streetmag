class IssuesController < ApplicationController
  load_and_authorize_resource
  layout "subdomain"

  def index
    @publication = Publication.find_by_name!(request.subdomain)
    @issues = @publication.issues
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @issue = @publication.issues.find(params[:id])
  end

end
