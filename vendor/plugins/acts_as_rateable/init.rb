# Include hook code here
require 'acts_as_rateable'
ActiveRecord::Base.send(:include, Rateable)
