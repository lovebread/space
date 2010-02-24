class Youku
	
	include HTTParty

	format :json

	base_uri 'v.youku.com/player/getPlayList'
	
	def initialize(obj)
		@video_id = obj.video_url.split('id_').last.split('.').first
		@embed_url = "http://player.youku.com/player.php/sid/"+ @video_id +"/v.swf"
		@response  = self.class.get("/VideoIDS/#{@video_id}")
	end

	def thumbnail_url
		if @response
			@response["data"][0]["logo"] 
		else
			"/images/blank_video.png"
		end
	end

	def embed_html
		"<embed src=\""+ @embed_url + "\" quality=\"high\" width=\"480\" height=\"400\" align=\"middle\" allowScriptAccess=\"sameDomain\" type=\"application/x-shockwave-flash\"></embed>"	
	end

end
