class Publication < ActiveRecord::Base
  has_many :issues
  validates_presence_of :title
  validates_presence_of :subtitle
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed"
  validates_uniqueness_of :name
end
