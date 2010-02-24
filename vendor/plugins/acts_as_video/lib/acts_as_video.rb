# ActsAsVideo

module ActsAsVideo

	YOUKU_RE = /http:\/\/v\.youku\.com\/v_show\/id_[\w]*\=?\.html/
	TUDOU_RE = /http:\/\/www\.tudou\.com\/programs\/view\/[\w]*\/?/
	KU6_RE	 = /http:\/\/v\.ku6\.com\/show\/[\w]*\.html/

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		
		def acts_as_video
			
			extend ActsAsVideo::SingletonMethods

			include ActsAsVideo::InstanceMethods

			before_save :setup_video_info

		end

	end

	module SingletonMethods
	end

	module InstanceMethods

		def type
			return Youku if YOUKU_RE =~ video_url
			return Tudou if TUDOU_RE =~ video_url
			return Ku6	 if KU6_RE	 =~ video_url
		end

		def setup_video_info
			unless video_url.blank?
				video_type = self.type
				if video_type.blank?
					errors.add_to_base("不能识别的视频url")
          return false
					#raise ActsAsVideo::NotRecognizedURL
				else 
					video = video_type.new(self)
					self.embed_html = video.embed_html
					self.thumbnail_url = video.thumbnail_url
				end
			end
		end

	end

	class NotRecognizedURL < StandardError; end

end

ActiveRecord::Base.send(:include, ActsAsVideo)
