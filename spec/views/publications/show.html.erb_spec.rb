require 'spec_helper'

describe "publications/show.html.erb" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication,
      :title => "Title",
      :subtitle => "Subtitle",
      :name => "Name",
      :welcome => "MyText",
      :copyright => "Copyright",
      :issn => "Issn",
      :publisher => "Publisher"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Subtitle/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Copyright/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Issn/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Publisher/)
  end
end
