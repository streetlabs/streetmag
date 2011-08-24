class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :cloud_files,
                    :cloudfiles_credentials => "#{Rails.root}/config/rackspace_cloudfiles.yml",
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => "ckeditor_assets/attachments/:id/:filename"
  
  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data
	
	def url_thumb
	  @url_thumb ||= begin
	    extname = File.extname(filename).gsub(/^\./, '')
      "/javascripts/ckeditor/filebrowser/images/thumbs/#{extname}.gif"
	  end
	end
end
