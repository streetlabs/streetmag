require 'spec_helper'

describe "articles/edit.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :new_record? => false,
      :title => "MyString",
      :author_id => 1,
      :abstract => "MyText",
      :content => "MyText",
      :notes => "MyText",
      :cited_works => "MyText",
      :excerpt => "MyText",
      :photo_file_name => "MyString",
      :photo_content_type => "MyString",
      :photo_file_size => 1
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => article_path(@article), :method => "post" do
      assert_select "input#article_title", :name => "article[title]"
      assert_select "input#article_author_id", :name => "article[author_id]"
      assert_select "textarea#article_abstract", :name => "article[abstract]"
      assert_select "textarea#article_content", :name => "article[content]"
      assert_select "textarea#article_notes", :name => "article[notes]"
      assert_select "textarea#article_cited_works", :name => "article[cited_works]"
      assert_select "textarea#article_excerpt", :name => "article[excerpt]"
      assert_select "input#article_photo_file_name", :name => "article[photo_file_name]"
      assert_select "input#article_photo_content_type", :name => "article[photo_content_type]"
      assert_select "input#article_photo_file_size", :name => "article[photo_file_size]"
    end
  end
end
