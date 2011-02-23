require 'subdomain'

Streetmag::Application.routes.draw do

  
  
  resources :site_pages,  :only => [:index, :show], :path => 'hub'
  resources :articles, :only => [:index, :show]


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
  
  resources :publications, :only => [:index, :show] do
    resource :about
    resource :people
    resource :submissions
    resources :issues, :only => [:index, :show]
    resources :sections, :only => [:index, :show]
    resources :authors, :only => [:index, :show]
    resources :posts, :only => [:index, :show]
  end
  
  
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
