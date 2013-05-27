class User < ActiveRecord::Base
	has_many :images
	validates :tumblr_name, :uniqueness => true




	def configure auth
		Tumblr.configure do |conf|
	  		conf.consumer_key = "7mySVGuCqH0jU4zqXrWJsfEOQMMHGysPGEAhz921Hq2lKQJQMC"
	  		conf.consumer_secret = "WBQpLDQWnnrjnVyWCXB2lSb6pn0R77N5k7iJMGEgQVhkEfh86p"
	  		conf.oauth_token = auth[:token]
	  		conf.oauth_token_secret = auth[:secret]
	  	end
	end

	def set name, blogs
		self.tumblr_name = name
		cnt = 1
		self.blogs = ''
		blogs.each do |blog|
			self.blogs <<  blog.name+','
			cnt += 1
		end
		self.blogs[self.blogs.length-1] = ''
		self.blogs.gsub('\n','')
	end

end
