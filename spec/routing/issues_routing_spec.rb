require "spec_helper"

describe IssuesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/issues" }.should route_to(:controller => "issues", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/issues/new" }.should route_to(:controller => "issues", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/issues/1" }.should route_to(:controller => "issues", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/issues/1/edit" }.should route_to(:controller => "issues", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/issues" }.should route_to(:controller => "issues", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/issues/1" }.should route_to(:controller => "issues", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/issues/1" }.should route_to(:controller => "issues", :action => "destroy", :id => "1")
    end

  end
end
