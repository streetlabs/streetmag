require 'spec_helper'

describe Publication do
  it "should do something that works" do
    publication = Publication.new
    publication.name = "Title"
    publication.name.should == "Title"
  end
end
