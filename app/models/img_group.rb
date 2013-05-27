class ImgGroup < ActiveRecord::Base
	def self.create_image img, user
		new_img = Image.new
		new_img.filename = img.original_filename
		new_img.content_type = img.content_type
	    new_img.data = img.read
	    new_img.user = user
	    new_img.save
	    new_img
	end

	def self.post image, user, blog
	  	client = Tumblr::Client.new
	  	client.photo(blog+'.tumblr.com', 
	  		:data_raw => [image.read], 
	  		:caption => user.captation, 
	  		:link => user.link, 
	  		:tags => user.tags,
	  		:state => 'queue') 
	end
end
