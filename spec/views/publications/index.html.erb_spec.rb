require 'spec_helper'

describe "publications/index.html.erb" do
  before(:each) do
    assign(:publications, [
      stub_model(Publication,
        :title => "Title",
        :subtitle => "Subtitle",
        :name => "Name",
        :welcome => "MyText",
        :copyright => "Copyright",
        :issn => "Issn",
        :publisher => "Publisher"
      ),
      stub_model(Publication,
        :title => "Title",
        :subtitle => "Subtitle",
        :name => "Name",
        :welcome => "MyText",
        :copyright => "Copyright",
        :issn => "Issn",
        :publisher => "Publisher"
      )
    ])
  end

  it "renders a list of publications" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Copyright".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Issn".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
  end
end
