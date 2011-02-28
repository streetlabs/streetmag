class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, :through => :authorships
  has_many :site_pages
  belongs_to :publication
  validates_presence_of :name
end
