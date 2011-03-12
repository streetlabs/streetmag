class SitePage < ActiveRecord::Base
  belongs_to :author
  belongs_to :publication
  
  attr_protected :publication_id

end
