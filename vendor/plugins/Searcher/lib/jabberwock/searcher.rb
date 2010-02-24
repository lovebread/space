module Jabberwock # :nodoc:
    # === Searcher
    # A simple and lightweight 'search' method for ActiveRecord::Base models
    # which will search all string and text based columns for the specified
    # criteria.
    #
    # == Usage:
    # MyModel.find('some text', options)
    #   where options are ActiveRecord::Base.find options
    #
    # == Note:
    # You may specify which columns get searched in your ActiveRecord model
    # by specifying +searcher_column+ or +seacher_columns+, e.g.:
    #
    # class Foo < ActiveRecord::Base
    #     searcher_columns :col1, :col2
    # end
    #
    #
    # Copyright: (c) 2009 Michael Behan (djether at gmail)
    module Searcher
        def self.included(base)
            base.extend ClassMethods
        end


        module ClassMethods
            # Allow user to define which columns should be searched
            def searcher_columns(*columns)
                cattr_accessor :searchable_columns
                self.searchable_columns = columns.to_a
            end

            alias searcher_column searcher_columns


            # This is the method that is used directly.
            def search(crit, opts = {})

                if !defined?(self.searchable_columns) then
                    searcher_columns(*get_column_names)
                end

                crit      = "%#{crit}%"
                columns   = self.searchable_columns 
                count     = columns.size
                bind_vars = crit.to_a * count
                bind_vars.insert(0,build_like_query(self.searchable_columns))

                cond = opts[:conditions]
                if cond.blank?
                  opts[:conditions] = bind_vars 
                else
                  opts[:conditions] = "(#{sanitize_sql_for_conditions(cond)}) AND (#{sanitize_sql_for_conditions(bind_vars)})"
                end
                self.find(:all, opts)
            end


            private
            # Scan the ActiveRecord model text and string columns
            def get_column_names
                self.columns.find_all{|c| c.type==:text || c.type==:string}.collect(&:name).to_a
            end

            # Build the LIKE clauses of the SQL query based on our matching columns
            def build_like_query(columns)
                str = ''
                for i in 0..columns.size
                    break if i==columns.size
                    str += "OR " if i>0
                    str += columns[i].to_s + " LIKE ? "
                end
                str
            end

        end # ClassMethods
    end # Searcher
end # Jabberwock
