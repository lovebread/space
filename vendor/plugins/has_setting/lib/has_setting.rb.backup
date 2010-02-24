# HasSetting
module HasSetting

	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods

		def acts_as_setting opts

			cattr_accessor :setting_opts

			self.setting_opts = opts

			include HasSetting::InstanceMethods

      extend HasSetting::SingletonMethods	

		end

		def has_setting name, opts={}

			# get class
			setting_class = opts[:class_name].blank? ? name.to_s.camelize.constantize : opts[:class_name].constantize

			attribute = opts[:attribute].blank? ? name : opts[:attribute]

			define_method("#{name}") do
				if instance_variable_get("@#{name}").blank?
					instance_variable_set("@#{name}", Setting.new(self, name, read_attribute(attribute), setting_class.bits, setting_class.keys))
				end
				instance_variable_get("@#{name}")
			end

		end

	end

	module SingletonMethods
		
		def bits
			setting_opts[:bits]
		end

		def keys
			setting_opts[:keys]
		end
	
		def default
			int = 0
			bits = setting_opts[:bits]
			setting_opts[:defaults].each_with_index do |v, i|
				int += (v.to_i << (bits * i))
			end
			int
		end

	end

	module InstanceMethods		
	
	end

	class Setting
		
		def initialize instance, name, value, bits, keys
			@instance = instance
			@name = name
			@value = value
			@bits = bits || 1
			@filter = ("1" * @bits).to_i(2)
			keys.each_with_index do |key, index|
				self.class.class_eval do
					define_method key do
						(@value >> (@bits * index)) & @filter
					end
				end
			end
			keys.each_with_index do |key, index|
				self.class.class_eval do
					define_method "#{key}=" do |value|
						mask = (@filter << (index * @bits))
						@value = (@value & ~mask) | (value << (index * @bits))
					end
				end
			end	
		end

		def update value
			if value.is_a? Integer
				@value = value
				@instance.update_attribute(@name, @value)
			end
		end

		def update_attributes value
			if value.is_a? Hash
        value.each do |key, value|
          send("#{key}=", value.to_i) if respond_to?("#{key}=") 
        end
				@instance.update_attribute(@name, @value)
			end
		end

		def save
			@instance.update_attribute(@name, @value)
		end

	end

end

ActiveRecord::Base.send(:include, HasSetting)
