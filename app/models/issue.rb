class Issue < ActiveRecord::Base
  belongs_to :publication
  has_many :articles
  has_many :reviews
  has_one :editorial
  #validates_presence_of :publication
  validates_presence_of :title
  validates_numericality_of :volume, :only_integer => true
  validates_numericality_of :issue_number, :only_integer => true
  validates_numericality_of :year, :only_integer => true
end
