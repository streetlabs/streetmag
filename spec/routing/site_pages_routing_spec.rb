require "spec_helper"

describe SitePagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/site_pages" }.should route_to(:controller => "site_pages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/site_pages/new" }.should route_to(:controller => "site_pages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/site_pages/1" }.should route_to(:controller => "site_pages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/site_pages/1/edit" }.should route_to(:controller => "site_pages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/site_pages" }.should route_to(:controller => "site_pages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/site_pages/1" }.should route_to(:controller => "site_pages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/site_pages/1" }.should route_to(:controller => "site_pages", :action => "destroy", :id => "1")
    end

  end
end
