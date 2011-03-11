class ArticlesController < ApplicationController
  layout "subdomain"
  
  # GET /articles
  def index
    @publication = Publication.find_by_name!(request.subdomain)
    @search = params[:search]
    if @search != nil
      @articles = Article.search "%#{@search}%", :star => true
    else
      @articles = @publication.articles
    end
    
  end
  

  # GET /articles/1
  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @article = @publication.articles.find(params[:id])
  end

end
