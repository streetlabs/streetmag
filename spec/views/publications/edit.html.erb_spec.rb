require 'spec_helper'

describe "publications/edit.html.erb" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication,
      :new_record? => false,
      :title => "MyString",
      :subtitle => "MyString",
      :name => "MyString",
      :welcome => "MyText",
      :copyright => "MyString",
      :issn => "MyString",
      :publisher => "MyString"
    ))
  end

  it "renders the edit publication form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => publication_path(@publication), :method => "post" do
      assert_select "input#publication_title", :name => "publication[title]"
      assert_select "input#publication_subtitle", :name => "publication[subtitle]"
      assert_select "input#publication_name", :name => "publication[name]"
      assert_select "textarea#publication_welcome_editor", :name => "publication[welcome]"
      assert_select "input#publication_copyright", :name => "publication[copyright]"
      assert_select "input#publication_issn", :name => "publication[issn]"
      assert_select "input#publication_publisher", :name => "publication[publisher]"
    end
  end
end
