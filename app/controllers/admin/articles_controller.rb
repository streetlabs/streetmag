class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /articles
  def index
    @publication = Publication.find(params[:publication_id])
    @articles = @publication.articles
  end

  # GET /articles/1
  def show
    @publication = Publication.find(params[:publication_id])
    @article = @publication.articles.find(params[:id])

  end

  # GET /articles/new
  def new
    @publication = Publication.find(params[:publication_id])
    @article = Article.new
    @arrangement = Arrangement.new
  end

  # GET /articles/1/edit
  def edit
    @publication = Publication.find(params[:publication_id])
    @article = @publication.articles.find(params[:id])
    @arrangement = @article.arrangement
  end

  # POST /articles
  def create
    @publication = Publication.find(params[:publication_id])
    @article= @publication.articles.create(params[:article])

    if @article.save
      redirect_to(admin_publication_admin_articles_path(@publication), :notice => 'Article was successfully created.')
    else
        render :action => "new"
    end

  end


  # PUT /articles/1
  def update
    @publication = Publication.find(params[:publication_id])
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to( admin_publication_admin_article_path(@publication, @article), :notice => 'Article was successfully updated.')
    else
      render :action => "edit" 
    end
    
  end

  # DELETE /articles/1
  def destroy
    @publication = Publication.find(params[:publication_id])
    @article = @publication.articles.find(params[:id])
    @article.destroy
    
    redirect_to admin_publication_admin_articles_path(@publication)
  end
end
