require 'spec_helper'

describe IssuesController do

  def mock_issue(stubs={})
    (@mock_issue ||= mock_model(Issue).as_null_object).tap do |issue|
      issue.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all issues as @issues" do
      Issue.stub(:all) { [mock_issue] }
      get :index
      assigns(:issues).should eq([mock_issue])
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      Issue.stub(:find).with("37") { mock_issue }
      get :show, :id => "37"
      assigns(:issue).should be(mock_issue)
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      Issue.stub(:new) { mock_issue }
      get :new
      assigns(:issue).should be(mock_issue)
    end
  end

  describe "GET edit" do
    it "assigns the requested issue as @issue" do
      Issue.stub(:find).with("37") { mock_issue }
      get :edit, :id => "37"
      assigns(:issue).should be(mock_issue)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created issue as @issue" do
        Issue.stub(:new).with({'these' => 'params'}) { mock_issue(:save => true) }
        post :create, :issue => {'these' => 'params'}
        assigns(:issue).should be(mock_issue)
      end

      it "redirects to the created issue" do
        Issue.stub(:new) { mock_issue(:save => true) }
        post :create, :issue => {}
        response.should redirect_to(issue_url(mock_issue))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        Issue.stub(:new).with({'these' => 'params'}) { mock_issue(:save => false) }
        post :create, :issue => {'these' => 'params'}
        assigns(:issue).should be(mock_issue)
      end

      it "re-renders the 'new' template" do
        Issue.stub(:new) { mock_issue(:save => false) }
        post :create, :issue => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested issue" do
        Issue.should_receive(:find).with("37") { mock_issue }
        mock_issue.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :issue => {'these' => 'params'}
      end

      it "assigns the requested issue as @issue" do
        Issue.stub(:find) { mock_issue(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:issue).should be(mock_issue)
      end

      it "redirects to the issue" do
        Issue.stub(:find) { mock_issue(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(issue_url(mock_issue))
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        Issue.stub(:find) { mock_issue(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:issue).should be(mock_issue)
      end

      it "re-renders the 'edit' template" do
        Issue.stub(:find) { mock_issue(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      Issue.should_receive(:find).with("37") { mock_issue }
      mock_issue.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the issues list" do
      Issue.stub(:find) { mock_issue }
      delete :destroy, :id => "1"
      response.should redirect_to(issues_url)
    end
  end

end
