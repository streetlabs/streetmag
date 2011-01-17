require 'spec_helper'

describe "authors/index.html.erb" do
  before(:each) do
    assign(:authors, [
      stub_model(Author,
        :name => "Name",
        :email => "Email",
        :url => "Url",
        :affiliation => "Affiliation",
        :bio => "MyText"
      ),
      stub_model(Author,
        :name => "Name",
        :email => "Email",
        :url => "Url",
        :affiliation => "Affiliation",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Affiliation".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
