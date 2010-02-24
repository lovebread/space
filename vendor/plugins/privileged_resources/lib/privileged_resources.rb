# PrivilegedResource
module PrivilegedResources

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_privileged_resources

      include PrivilegedResources::InstanceMethods

      extend PrivilegedResources::SingletonMethods
    end

  end

	module SingletonMethods

			def viewable(relationship, opts={})
			  conditions = opts.delete(:conditions) || {}
				if conditions.is_a? Hash
					case relationship
					when 'owner'
					when 'friend'
						conditions.merge!({:privilege => [1,2,3]})
					when 'same_game'
						conditions.merge!({:privilege => [1,2]})
					when 'stranger'
						conditions.merge!({:privilege => 1})
					end
				elsif conditions.is_a? Array
					case relationship
					when 'owner'
					when 'friend'
						condtions[0] = "(" + conditions[0] + ")" + " AND privilege IN (1,2,3)"
					when 'same_game'
						condtions[0] = "(" + conditions[0] + ")" + " AND privilege IN (1,2)"
					when 'stranger'
						condtions[0] = "(" + conditions[0] + ")" + " AND privilege IN (1)"
					end
				elsif conditions.is_a? String
          case relationship
          when 'owner'
          when 'friend'
            condtions = "(" + conditions + ")" + " AND privilege IN (1,2,3)"
          when 'same_game'
            condtions = "(" + conditions + ")" + " AND privilege IN (1,2)"
          when 'stranger'
            condtions = "(" + conditions + ")" + " AND privilege IN (1)"
					end
				end
				opts.merge!({:conditions => conditions})
				find(:all, opts)
			end
		
		end
  
		module InstanceMethods
		end

end

ActiveRecord::Base.send(:include, PrivilegedResources)

