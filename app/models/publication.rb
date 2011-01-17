class Publication < ActiveRecord::Base
  has_many :arrangements, :dependent => :destroy
  has_many :authors, :dependent => :destroy
  has_many :issues, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :articles, :through => :arrangements, :dependent => :destroy
  validates_presence_of :title
  validates_presence_of :subtitle
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed"
  validates_uniqueness_of :name
end
