require 'spec_helper'

describe SectionsController do

  def mock_section(stubs={})
    (@mock_section ||= mock_model(Section).as_null_object).tap do |section|
      section.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all sections as @sections" do
      Section.stub(:all) { [mock_section] }
      get :index
      assigns(:sections).should eq([mock_section])
    end
  end

  describe "GET show" do
    it "assigns the requested section as @section" do
      Section.stub(:find).with("37") { mock_section }
      get :show, :id => "37"
      assigns(:section).should be(mock_section)
    end
  end

  describe "GET new" do
    it "assigns a new section as @section" do
      Section.stub(:new) { mock_section }
      get :new
      assigns(:section).should be(mock_section)
    end
  end

  describe "GET edit" do
    it "assigns the requested section as @section" do
      Section.stub(:find).with("37") { mock_section }
      get :edit, :id => "37"
      assigns(:section).should be(mock_section)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created section as @section" do
        Section.stub(:new).with({'these' => 'params'}) { mock_section(:save => true) }
        post :create, :section => {'these' => 'params'}
        assigns(:section).should be(mock_section)
      end

      it "redirects to the created section" do
        Section.stub(:new) { mock_section(:save => true) }
        post :create, :section => {}
        response.should redirect_to(section_url(mock_section))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved section as @section" do
        Section.stub(:new).with({'these' => 'params'}) { mock_section(:save => false) }
        post :create, :section => {'these' => 'params'}
        assigns(:section).should be(mock_section)
      end

      it "re-renders the 'new' template" do
        Section.stub(:new) { mock_section(:save => false) }
        post :create, :section => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested section" do
        Section.should_receive(:find).with("37") { mock_section }
        mock_section.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :section => {'these' => 'params'}
      end

      it "assigns the requested section as @section" do
        Section.stub(:find) { mock_section(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:section).should be(mock_section)
      end

      it "redirects to the section" do
        Section.stub(:find) { mock_section(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(section_url(mock_section))
      end
    end

    describe "with invalid params" do
      it "assigns the section as @section" do
        Section.stub(:find) { mock_section(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:section).should be(mock_section)
      end

      it "re-renders the 'edit' template" do
        Section.stub(:find) { mock_section(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested section" do
      Section.should_receive(:find).with("37") { mock_section }
      mock_section.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sections list" do
      Section.stub(:find) { mock_section }
      delete :destroy, :id => "1"
      response.should redirect_to(sections_url)
    end
  end

end
