module UsersHelper
	def gravatar_url(email, size)
	  gravatar_id = Digest::MD5::hexdigest(email).downcase
	  default_url = "http://i.dailymail.co.uk/i/pix/2011/06/10/article-2001697-0C816FEB00000578-38_306x423.jpg"
	  url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
	end
end