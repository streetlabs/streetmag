class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :arrangement
  accepts_nested_attributes_for :arrangement, :allow_destroy => true
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :abstract
  validates_presence_of :content
  # Paperclip
  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :small  => "200x200>", :large  => "600x600>"  },
                    :storage => :cloud_files,
                    # :path => ":attachment/mypicture/:id/:style/:basename.:extension",
                    :cloudfiles_credentials => "#{RAILS_ROOT}/config/rackspace_cloudfiles.yml"
end
