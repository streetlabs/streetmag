require 'subdomain'

Streetmag::Application.routes.draw do

  
  
  resources :site_pages,  :only => [:show], :path => 'hub'
  resources :posts,  :only => [:show], :path => 'news'
  resources :articles, :only => [:show]


  scope "admin", :module=>"admin", :as=>"admin" do
    resources :publications do
      resources :issues, :as => "admin_issues"
      resources :arrangements, :as => "admin_arrangements"
      resources :sections, :as => "admin_sections"
      resources :authors, :as => "admin_authors"
      resources :articles, :as => "admin_articles"
      resources :posts, :as => "admin_posts"
      resources :site_pages, :as => "admin_site_pages"
    end
  end
  
  resources :publications, :only => [:index, :show]
  
  
  devise_for :users
  
  #match '/mobile', :controller => 'high_voltage/pages', :action => 'show', :id => 'mobile'
  match '/home', :controller => 'high_voltage/pages', :action => 'show', :id => 'home'
  
  constraints(Subdomain) do  
    match '/' => 'publications#show'  
    match '/about' => 'publications#about'
    match '/people' => 'publications#people'
    match '/submissions' => 'publications#submissions' 
    match '/hub/:id' => 'site_pages#show'
  end
  
  root :to => 'high_voltage/pages', :action => 'show', :id => 'home'
  
end
