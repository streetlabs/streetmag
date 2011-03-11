require 'subdomain'

Streetmag::Application.routes.draw do
  
  resources :site_pages,  :only => [:show], :path => 'hub'
  resources :posts,  :only => [:show], :path => 'news'
  resources :articles, :only => [:show, :index, :search]


  scope "admin", :module=>"admin", :as=>"admin", :constraints => { :protocol => "https" } do
    resources :publications do
      resources :issues, :as => "admin_issues"
      resources :arrangements, :as => "admin_arrangements"  do
        collection do
          post 'sort'
        end
      end
      resources :sections, :as => "admin_sections"
      resources :authors, :as => "admin_authors"
      resources :articles, :as => "admin_articles"
      resources :posts, :as => "admin_posts"
      resources :site_pages, :as => "admin_site_pages"
    end
  end
  
  resources :publications, :only => [:index, :show]
  
  
  constraints :protocol => "https" do
    devise_for :users
  end
  
  #match '/mobile', :controller => 'high_voltage/pages', :action => 'show', :id => 'mobile'
  match '/home', :controller => 'high_voltage/pages', :action => 'show', :id => 'home'
  
  constraints(Subdomain) do  
    match '/' => 'publications#show'  
    match '/about' => 'publications#about'
    match '/people' => 'publications#people'
    match '/submissions' => 'publications#submissions' 
    match '/hub/:id' => 'site_pages#show'
  end
  
  # Redirect to https for user and admin paths
  match "admin(/*path)", :to => redirect { |_, request| "https://" + request.host_with_port + request.fullpath }
  match "users(/*path)", :to => redirect { |_, request| "https://" + request.host_with_port + request.fullpath }
  
  root :to => 'high_voltage/pages', :action => 'show', :id => 'home'
  
end
