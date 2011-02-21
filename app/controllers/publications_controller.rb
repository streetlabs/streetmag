class PublicationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)  
    #@publication = Publication.find(params[:id])
  end

end
