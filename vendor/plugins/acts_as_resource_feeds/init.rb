require File.dirname(__FILE__) + '/lib/resource_feeds'
ActiveRecord::Base.send(:include, ResourceFeeds)
