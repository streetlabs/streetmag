class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :arrangement
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :abstract
  validates_presence_of :content
  # Paperclip
  accepts_nested_attributes_for :arrangement, :allow_destroy => true
  has_attached_file :photo,:styles => {:thumb=> "100x100#", :small  => "200x200>", :large  => "600x600>" }
end
