class Section < ActiveRecord::Base
  belongs_to :publication  
  belongs_to :parent, :class_name => "Section", :foreign_key => "parent_id"
  has_many :children, :class_name => "Section", :foreign_key => "parent_id", :dependent => :destroy
  has_many :articles, :through => :arrangements, :dependent => :destroy
  has_many :arrangements, :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :publication
  
  attr_protected :publication_id
  
  scope :hub, where("is_static = ?", true).order("sections.position ASC")
  scope :main, where("is_static = ?", false).order("sections.position ASC")
  scope :ordered, order("sections.position ASC")
  
end
