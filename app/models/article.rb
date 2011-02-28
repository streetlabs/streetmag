class Article < ActiveRecord::Base
  has_one :arrangement
  has_one :publication, :through =>:arrangement
  has_one :section, :through =>:arrangement
  has_many :authorships
  has_many :authors, :through => :authorships
  accepts_nested_attributes_for :authorships, :allow_destroy => true, :reject_if => lambda { |a| a[:author_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :arrangement, :allow_destroy => true
  validates_presence_of :title
  validates_presence_of :abstract
  validates_presence_of :content
  # Paperclip
  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :small  => "200x200>", :large  => "600x600>"  },
                    :storage => :cloud_files,
                    :cloudfiles_credentials => "#{RAILS_ROOT}/config/rackspace_cloudfiles.yml"
                    
  def editors
    return self.publication == nil ? Array.new : self.publication.managers;
  end
  def contributor
    return self.publication == nil ? Array.new : self.publication.managers;
  end
  
  
  def formatted_title
    if self.is_textiled? 
      return RedCloth.new(self.title, [:lite_mode, :filter_html]).to_html
    else
      return self.title
    end
  end
  
  def author
    self.authorships.each do |authorship| 
      return authorship.author if authorship.is_primary?
    end
    return self.authorships.first().author unless self.authorships.first() == nil
    return nil
  end
  
end
