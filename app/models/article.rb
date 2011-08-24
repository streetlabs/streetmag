class Article < ActiveRecord::Base
  has_one :arrangement
  has_one :publication, :through =>:arrangement
  has_one :section, :through =>:arrangement
  has_many :authorships
  has_many :authors, :through => :authorships
  accepts_nested_attributes_for :authorships, :reject_if => lambda { |a| a[:author_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :arrangement, :allow_destroy => true
  validates_presence_of :title
  validates_presence_of :abstract
  validates_presence_of :content
  # Paperclip
  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :small  => "200x200>", :large  => "600x600>"  },
                    :storage => :cloud_files,
                    :cloudfiles_credentials => "#{Rails.root}/config/rackspace_cloudfiles.yml"                                    
  
  define_index do
    # fields
    indexes title, :sortable => true
    indexes content, :sortable => true
    indexes abstract, :sortable => true
    indexes notes, :sortable => true
    indexes cited_works, :sortable => true
    #indexes publication(:title), :as => :publication , :sortable => true
    #indexes arrangement.issue(:title), :as => :issue, :sortable => true
    indexes arrangement.section(:name), :as => :section, :sortable => true
    indexes authorships.author(:name), :as => :name, :sortable => true
    #indexes arrangement.publication, :as => :publication, :sortable => true
    
    # attributes
    has title, :as => :article_title 
    created_at
    updated_at
    
    set_property :field_weights => {
      :title => 20,
      :name => 14,
      :content => 10,
      :section => 5,
      :abstract => 3,
      :notes => 2,
      :cited_works => 2,
    }
    
  end  
                    
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
