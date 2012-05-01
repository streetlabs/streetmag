class PublicationsController < ApplicationController
  layout "subdomain"
  
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by_name!(request.subdomain)
    @issue = @publication.issues.published.first 
    @news
  end
  
  def issues
    descriptor = params[:descriptor]
    @publication = Publication.find_by_name!(request.subdomain)
    @issue = @publication.issues.where(:descriptor => descriptor).first
      redirect_to view_context.publication_issues_path( @publication.issues.published.last.descriptor ) if @issue.nil?
    @news
  end
  
  def archive
    descriptor = params[:descriptor]
    @publication = Publication.find_by_name!(request.subdomain)
    @issues = @publication.issues.order("publication_date ASC")
    @news
  end
  
  def about
    @publication = Publication.find_by_name!(request.subdomain)
  end

end
