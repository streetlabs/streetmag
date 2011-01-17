class Author < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  belongs_to :publication
  validates_presence_of :name
end
