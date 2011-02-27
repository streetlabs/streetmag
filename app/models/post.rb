class Post < ActiveRecord::Base
  belongs_to :publication
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :summary
  validates_presence_of :content
end
