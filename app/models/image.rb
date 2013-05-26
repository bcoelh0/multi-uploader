class Image < ActiveRecord::Base
	belongs_to :user
	attr_accessor :attached_assets_attrs
	attr_accessor :attachment
	attr_accessor :original_filename


	def set img, user
		self.filename = img.original_filename
		self.content_type = img.content_type
	    self.data = img.read
	    self.user = user
	end
end
