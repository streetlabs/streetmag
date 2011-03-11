class PostsController < ApplicationController
  layout "subdomain"
  
  # GET /articles
  def index
    @publication = Publication.find_by_name!(request.subdomain)
    @posts = @publication.posts
  end

  # GET /articles/1
  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @post = @publication.posts.find(params[:id])

  end

end
