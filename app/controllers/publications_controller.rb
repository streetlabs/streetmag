class PublicationsController < ApplicationController
  layout "subdomain"
  
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @issue = @publication.issues.first 
  end
  
  def about
    @publication = Publication.find_by_name!(request.subdomain)
  end

end
