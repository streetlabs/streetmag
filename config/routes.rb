require 'subdomain'

Streetmag::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "admin/registrations", :sessions => "admin/sessions", :confirmations => "admin/confirmations", :passwords => "admin/passwords", :unlocks => "admin/unlocks"}
  
  resources :site_pages,  :only => [:show], :path => 'hub'
  resources :posts,  :only => [:show], :path => 'news'
  resources :articles, :only => [:show, :index]
  resources :publications, :only => [:index, :show]

  scope "admin", :module=>"admin", :as=>"admin" do
    resources :publications do
      resources :issues, :as => "admin_issues"
      resources :arrangements, :as => "admin_arrangements"  do
        collection do
          get 'hub'
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
  

  
  #match '/mobile', :controller => 'high_voltage/pages', :action => 'show', :id => 'mobile'
  match '/home', :controller => 'high_voltage/pages', :action => 'show', :id => 'home'
  
  constraints(Subdomain) do  
    match '/' => 'publications#show'  
    match '/about' => 'publications#about'
    match '/people' => 'publications#people'
    match '/submissions' => 'publications#submissions'
    match '/archive' => 'publications#archive'
    match '/issues/:descriptor' => 'publications#issues'
    match '/hub/:id' => 'site_pages#show'
  end
  
  # Redirect to https for user and admin paths
  match "admin(/*path)", :to => redirect { |_, request| "https://" + request.host_with_port + request.fullpath }
  match "users(/*path)", :to => redirect { |_, request| "https://" + request.host_with_port + request.fullpath }
  
  root :to => 'high_voltage/pages', :action => 'show', :id => 'home'
  
end
