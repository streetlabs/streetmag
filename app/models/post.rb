class Post < ActiveRecord::Base
  belongs_to :publication
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :summary
  validates_presence_of :content
  
  attr_protected :publication_id
  
  def formatted_summary
    return RedCloth.new(self.summary, [:lite_mode, :filter_html]).to_html
  end
  
end
