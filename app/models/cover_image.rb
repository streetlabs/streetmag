class CoverImage < ActiveRecord::Base
  belongs_to :issue
  
  # Paperclip
  has_attached_file :photo,
                    :styles => { :large => "480", :thumb => "120" },
                    :storage => :cloud_files,
                    :path => "coverimages/:attachment/:id/:style/:basename.:extension",
                    :cloudfiles_credentials => "#{Rails.root}/config/rackspace_cloudfiles.yml"
end
