module ActsAsList

	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
	
		def acts_as_list opts

			cattr_accessor :list_opts
	
			self.list_opts = opts

      cattr_accessor :list_conds

      if opts[:conditions]
        self.list_conds = sanitize_sql_for_conditions opts[:conditions]
      else
        self.list_conds = ""
      end

			extend ActsAsList::SingletonMethods

			include ActsAsList::InstanceMethods

      

		end

	end

	module SingletonMethods
	end

	module InstanceMethods

		def scope_name
			self.class.list_opts[:scope]
		end

		def order_name
			self.class.list_opts[:order]
		end
		
		def scope
			send(scope_name)
		end

		def order
			send(order_name)
		end

    def cond
      self.class.list_conds == "" ?  "" : "AND (" + self.class.list_conds + ")"
    end

		def first
			self.class.find(:first, :conditions => ["#{scope_name} = ? #{cond}", scope], :order => "#{order_name} ASC")
		end

		def last
			self.class.find(:first, :conditions => ["#{scope_name} = ? #{cond}", scope], :order => "#{order_name} DESC")
		end

		def next
			self.class.find(:first, :conditions => ["#{scope_name} = ? AND #{order_name} > ? #{cond}", scope, order], :order => "#{order_name} ASC") ||first 
		end

		def prev
			self.class.find(:first, :conditions => ["#{scope_name} = ? AND #{order_name} < ? #{cond}", scope, order], :order => "#{order_name} DESC") ||last 
		end
	
	end

end

ActiveRecord::Base.send(:include, ActsAsList)
