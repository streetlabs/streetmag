require 'spec_helper'

describe "authors/edit.html.erb" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :name => "MyString",
      :email => "MyString",
      :url => "MyString",
      :affiliation => "MyString",
      :bio => "MyText"
    ))
  end

  it "renders the edit author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => author_path(@author), :method => "post" do
      assert_select "input#author_name", :name => "author[name]"
      assert_select "input#author_email", :name => "author[email]"
      assert_select "input#author_url", :name => "author[url]"
      assert_select "input#author_affiliation", :name => "author[affiliation]"
      assert_select "textarea#author_bio", :name => "author[bio]"
    end
  end
end
