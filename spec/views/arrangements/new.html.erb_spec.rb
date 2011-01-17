require 'spec_helper'

describe "arrangements/new.html.erb" do
  before(:each) do
    assign(:arrangement, stub_model(Arrangement,
      :issue_id => 1,
      :section_id => 1,
      :article_id => 1,
      :publication_id => 1
    ).as_new_record)
  end

  it "renders new arrangement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => arrangements_path, :method => "post" do
      assert_select "input#arrangement_issue_id", :name => "arrangement[issue_id]"
      assert_select "input#arrangement_section_id", :name => "arrangement[section_id]"
      assert_select "input#arrangement_article_id", :name => "arrangement[article_id]"
      assert_select "input#arrangement_publication_id", :name => "arrangement[publication_id]"
    end
  end
end
