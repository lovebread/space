# CounterWithRawSql
# this plugin is used for increment/decrement counter without triggering any callbacks
module CounterWithRawSql

	def self.included(base)
		define_method(:raw_increment) do |*args|
			attr, by = *args
			by ||= 1
			self.increment attr, by
      ActiveRecord::Base.connection.execute("UPDATE #{self.class.table_name} SET #{attr} = #{attr} + #{by} WHERE id = #{id}")
		end
		define_method(:raw_decrement) do |*args|
			attr, by = *args
			by ||= 1
      self.decrement attr, by
      ActiveRecord::Base.connection.execute("UPDATE #{self.class.table_name} SET #{attr} = #{attr} - #{by} WHERE id = #{id}")
    end
	end

end

ActiveRecord::Base.send(:include, CounterWithRawSql)
