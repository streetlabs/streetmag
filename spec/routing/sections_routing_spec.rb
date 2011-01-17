require "spec_helper"

describe SectionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sections" }.should route_to(:controller => "sections", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sections/new" }.should route_to(:controller => "sections", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sections/1" }.should route_to(:controller => "sections", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sections/1/edit" }.should route_to(:controller => "sections", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sections" }.should route_to(:controller => "sections", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sections/1" }.should route_to(:controller => "sections", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sections/1" }.should route_to(:controller => "sections", :action => "destroy", :id => "1")
    end

  end
end
