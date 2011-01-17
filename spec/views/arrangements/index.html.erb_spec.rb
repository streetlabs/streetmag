require 'spec_helper'

describe "arrangements/index.html.erb" do
  before(:each) do
    assign(:arrangements, [
      stub_model(Arrangement,
        :issue_id => 1,
        :section_id => 1,
        :article_id => 1,
        :publication_id => 1
      ),
      stub_model(Arrangement,
        :issue_id => 1,
        :section_id => 1,
        :article_id => 1,
        :publication_id => 1
      )
    ])
  end

  it "renders a list of arrangements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
