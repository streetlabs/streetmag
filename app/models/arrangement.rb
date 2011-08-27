class Arrangement < ActiveRecord::Base
  belongs_to :publication
  belongs_to :section
  belongs_to :article
  belongs_to :issue
  validates_uniqueness_of :article_id
  
  attr_protected :publication_id
  
  scope :ordered, order("arrangements.position ASC")
  scope :grouped, joins(:section).group("issue_id").group("section_id").order("issue_id, sections.position, arrangements.position ASC")
  
  acts_as_list
  
  define_index do
    # fields
    indexes publication(:title), :as => :publication, :sortable => true
    indexes article(:title), :as => :article, :sortable => true
    indexes issue(:title), :as => :issue, :sortable => true
    indexes section(:name), :as => :section, :sortable => true
    #indexes arrangement.publication, :as => :publication, :sortable => true
    
    # attributes
    has publication_id, section_id, article_id, issue_id, created_at, updated_at
  end
end
