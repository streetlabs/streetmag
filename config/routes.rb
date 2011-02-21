require 'subdomain'

Streetmag::Application.routes.draw do

  scope "admin", :module=>"admin", :as=>"admin" do
    resources :publications do
      resources :issues, :as => "admin_issues"
      resources :arrangements, :as => "admin_arrangements"
      resources :sections, :as => "admin_sections"
      resources :authors, :as => "admin_authors"
      resources :articles, :as => "admin_articles"
    end
  end
  
  resources :publications, :only => [:index, :show] do
    resources :issues, :only => [:index, :show]
    resources :sections, :only => [:index, :show]
    resources :authors, :only => [:index, :show]
    resources :articles, :only => [:index, :show]
  end
  
  
  devise_for :users
  
  #match '/mobile', :controller => 'high_voltage/pages', :action => 'show', :id => 'mobile'
  match '/home', :controller => 'high_voltage/pages', :action => 'show', :id => 'home'
  
  constraints(Subdomain) do  
    match '/' => 'publications#show'    
  end
  
  root :to => 'high_voltage/pages', :action => 'show', :id => 'home'
  
end
