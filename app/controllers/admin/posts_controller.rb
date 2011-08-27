class Admin::PostsController < ApplicationController
  before_filter :authenticate_user!
  force_ssl
  load_and_authorize_resource

  # GET /posts
  # GET /posts.xml
  def index
    @publication = Publication.find(params[:publication_id])
    @posts = @publication.posts
  end

  def show
    @publication = Publication.find(params[:publication_id])
    @post = @publication.posts.find(params[:id])
  end


  def new
    @publication = Publication.find(params[:publication_id])
    @post = Post.new
  end

  def edit
    @publication = Publication.find(params[:publication_id])
    @post = @publication.posts.find(params[:id])
  end

  def create

    @publication = Publication.find(params[:publication_id])
    @post = @publication.posts.create(params[:post])

    if @post.save
      redirect_to(admin_publication_admin_posts_path(@publication), :notice => 'Post was successfully created.')
    else
      render :action => "new" 
    end

  end

  def update
    @publication = Publication.find(params[:publication_id])
    @post = @publication.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to( admin_publication_admin_post_path(@publication, @post), :notice => 'Post was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @post = @publication.posts.find(params[:id])
    @post.destroy

     redirect_to admin_publication_admin_posts_path(@publication)
  end
end
