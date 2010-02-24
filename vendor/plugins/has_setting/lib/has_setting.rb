module ActsAsSetting

  def self.included recipient
    recipient.extend(ActsAsSetting::ClassMethods)
  end

  module ClassMethods

    def acts_as_setting opts

      cattr_accessor :setting_opts

      self.setting_opts = opts

      include ActsAsSetting::InstanceMethods

      extend ActsAsSetting::SingletonMethods

      define_method("initialize") do |value, instance, name|
        @value = value
        @instance = instance
        @name = name
        @bits = opts[:bits] || 1
        @filter = ("1" * @bits).to_i(2)
      end

      opts[:attributes].each_with_index do |attribute, index|

        define_method("#{attribute}") do
          (@value >> (@bits * index)) & @filter
        end

        define_method("#{attribute}=") do |value|
          mask = (@filter << (index * @bits))
          @value = (@value & ~mask) | (value << (index * @bits))
        end

      end

    end

  end

  module SingletonMethods

    def bits
      setting_opts[:bits]
    end

    def attributes
      setting_opts[:attributes]
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

# HasSetting
module HasSetting

	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods

		def has_setting name, opts={}

			# get class
			setting_class = opts[:class_name].blank? ? name.to_s.camelize.constantize : opts[:class_name].constantize

			attribute = opts[:attribute].blank? ? name : opts[:attribute]

			define_method("#{name}") do
				if instance_variable_get("@#{name}").blank?
					instance_variable_set("@#{name}", setting_class.new(read_attribute(attribute), self, name))
				end
				instance_variable_get("@#{name}")
			end

		end

	end

end

ActiveRecord::Base.send(:include, HasSetting)
