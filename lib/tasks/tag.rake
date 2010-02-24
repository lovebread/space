namespace :tag do

	task :delete_unused_tags => :environment do 
		tags = Tag.find(:all, :conditions => {:taggings_count => 0})
		Tag.destroy(tags.map(&:id))
	end

end
