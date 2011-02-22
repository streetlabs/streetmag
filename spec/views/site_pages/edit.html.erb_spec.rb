require 'spec_helper'

describe "site_pages/edit.html.erb" do
  before(:each) do
    @site_page = assign(:site_page, stub_model(SitePage,
      :title => "MyString",
      :content => "MyText",
      :author_id => 1,
      :publication_id => 1
    ))
  end

  it "renders the edit site_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => site_page_path(@site_page), :method => "post" do
      assert_select "input#site_page_title", :name => "site_page[title]"
      assert_select "textarea#site_page_content", :name => "site_page[content]"
      assert_select "input#site_page_author_id", :name => "site_page[author_id]"
      assert_select "input#site_page_publication_id", :name => "site_page[publication_id]"
    end
  end
end
