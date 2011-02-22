require 'spec_helper'

describe "site_pages/index.html.erb" do
  before(:each) do
    assign(:site_pages, [
      stub_model(SitePage,
        :title => "Title",
        :content => "MyText",
        :author_id => 1,
        :publication_id => 1
      ),
      stub_model(SitePage,
        :title => "Title",
        :content => "MyText",
        :author_id => 1,
        :publication_id => 1
      )
    ])
  end

  it "renders a list of site_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
