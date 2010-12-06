require 'spec_helper'

describe "publications/new.html.erb" do
  before(:each) do
    assign(:publication, stub_model(Publication,
      :title => "MyString",
      :subtitle => "MyString",
      :name => "MyString",
      :welcome => "MyText",
      :copyright => "MyString",
      :issn => "MyString",
      :publisher => "MyString"
    ).as_new_record)
  end

  it "renders new publication form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => publications_path, :method => "post" do
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
