class Article < ActiveRecord::Base
  belongs_to :author
  has_one :arrangement
  has_one :publication, :through =>:arrangement
  has_one :section, :through =>:arrangement
  accepts_nested_attributes_for :arrangement, :allow_destroy => true
  validates_presence_of :title
  validates_presence_of :author
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
end
