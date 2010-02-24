# ActsAsRandom
module ActsAsRandom

  def self.included base
    base.extend(ClassMethods)
  end

  module ClassMethods
  
    def acts_as_random opts={}

      include ActsAsRandom::InstanceMethods

      extend ActsAsRandom::SingletonMethods    

    end

  end

  module SingletonMethods
    
    def random opts={}
      count = self.count
      except = opts[:except] || []
      count = count - except.uniq.count
      count = 0 if count < 0
      limit = opts[:limit] || 1
      picked = []
      if count < limit
        # just return all records
        picked = self.all - except
      else
        limit.times.each do
          while 1
            record = self.find(:first, :offset => rand(count))
            if !picked.include?(record) and !except.include?(record)
              picked << record
              break
            end
          end
        end
        picked
      end
    end

  end

  module InstanceMethods
  end 

end

ActiveRecord::Base.send(:include, ActsAsRandom)
