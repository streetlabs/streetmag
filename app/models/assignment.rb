class Assignment < ActiveRecord::Base
  belongs_to :publication
  belongs_to :user
  belongs_to :role
  
  attr_protected :publication_id
  
  validates_uniqueness_of :role, :scope => :publication,
    :message => "You are only allowed one role on a given publication."
    
end
