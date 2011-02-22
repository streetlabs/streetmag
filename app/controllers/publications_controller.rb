class PublicationsController < ApplicationController
  load_and_authorize_resource
  layout "subdomain"
  
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @issue = @publication.issues.first 
    #@publication = Publication.find(params[:id])
  end

end
