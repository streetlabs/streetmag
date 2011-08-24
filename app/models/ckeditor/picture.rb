class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :cloud_files,
                    :cloudfiles_credentials => "#{Rails.root}/config/rackspace_cloudfiles.yml",
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => "ckeditor_assets/pictures/:id/:style_:basename.:extension",
	                  :styles => { :content => '800>', :thumb => '118x100#' }
	
	validates_attachment_size :data, :less_than => 5.megabytes
	validates_attachment_presence :data
	
	def url_content
	  url(:content)
	end
end
