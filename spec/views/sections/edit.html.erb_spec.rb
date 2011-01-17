require 'spec_helper'

describe "sections/edit.html.erb" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :name => "MyString",
      :publication_id => 1,
      :parent_id => 1
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => section_path(@section), :method => "post" do
      assert_select "input#section_name", :name => "section[name]"
      assert_select "input#section_publication_id", :name => "section[publication_id]"
      assert_select "input#section_parent_id", :name => "section[parent_id]"
    end
  end
end
