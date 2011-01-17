require 'spec_helper'

describe "arrangements/show.html.erb" do
  before(:each) do
    @arrangement = assign(:arrangement, stub_model(Arrangement,
      :issue_id => 1,
      :section_id => 1,
      :article_id => 1,
      :publication_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
