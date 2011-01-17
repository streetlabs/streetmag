class Arrangement < ActiveRecord::Base
  belongs_to :publication
  belongs_to :section
  belongs_to :article
  belongs_to :issue
  validates_uniqueness_of :article_id
end
