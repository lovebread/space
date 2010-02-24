class Tudou

	include HTTParty

	format :json

	base_uri ''

	def initialize(obj)
		@video_id = obj.video_url.split('view/').last.split('/').first
		@embed_url = "http://www.tudou.com/v/#{@video_id}"
	end

	def thumbnail_url
		"/images/blank.gif"
	end

	def embed_html
		"<object width=\"420\" height=\"363\"><param name=\"movie\" value=\""+ @video_id +"\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><param name=\"wmode\" value=\"opaque\"></param><embed src=\""+ @embed_url+"\"type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"opaque\" width=\"420\" height=\"363\"></embed></object>"
	end	

end
