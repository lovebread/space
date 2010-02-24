class Ku6

	include HTTParty

	def initialize(obj)
		@video_id = obj.video_url.split('show/').last.split('.').first
		@embed_url = "http://player.ku6.com/refer/#{@video_id}/v.swf"
	end

	def thumbnail_url
		"/images/blank_video.png"
	end

	def embed_html
		"<embed src=\"#{@embed_url}\" quality=\"high\" width=\"480\" height=\"400\" align=\"middle\" allowScriptAccess=\"always\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\"></embed>"
	end

end
