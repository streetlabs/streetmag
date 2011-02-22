require 'spec_helper'

describe "site_pages/show.html.erb" do
  before(:each) do
    @site_page = assign(:site_page, stub_model(SitePage,
      :title => "Title",
      :content => "MyText",
      :author_id => 1,
      :publication_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
