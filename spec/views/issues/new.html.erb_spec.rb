require 'spec_helper'

describe "issues/new.html.erb" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :title => "MyString",
      :volume => 1,
      :issue_number => 1,
      :year => 1,
      :publication_id => 1
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => issues_path, :method => "post" do
      assert_select "input#issue_title", :name => "issue[title]"
      assert_select "input#issue_volume", :name => "issue[volume]"
      assert_select "input#issue_issue_number", :name => "issue[issue_number]"
      assert_select "input#issue_year", :name => "issue[year]"
      assert_select "input#issue_publication_id", :name => "issue[publication_id]"
    end
  end
end
