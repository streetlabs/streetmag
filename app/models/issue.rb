class Issue < ActiveRecord::Base
  belongs_to :publication
  has_many :arrangements
  has_many :articles, :through => :arrangements, :dependent => :destroy
  has_many :sections, :through => :arrangements, :uniq => true
  #validates_presence_of :publication
  validates_presence_of :title
  validates_numericality_of :volume, :only_integer => true
  validates_numericality_of :issue_number, :only_integer => true
  
  attr_protected :publication_id
  
  
  scope :published, lambda {
    where("issues.is_published = ?", true).order("issues.created_at DESC")
  }
end
