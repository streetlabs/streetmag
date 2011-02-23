class ArticlesController < ApplicationController
  load_and_authorize_resource
  layout "subdomain"
  
  # GET /articles
  def index
    @publication = Publication.find_by_name!(request.subdomain)
    @articles = @publication.articles
  end

  # GET /articles/1
  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @article = @publication.articles.find(params[:id])

  end

end
