module TagsHelper

	def tag_cloud(taggable, classes)
		return if taggable.nil?
		tag_infos = taggable.taggings.group_by(&:tag)
		tags = tag_infos.map {|tag, taggings| tag}
		tagging_counts = tag_infos.map {|tag, taggings| taggings.count}
		max_count = tagging_counts.max
    
    tags.each_with_index do |tag, i|
      index = ((tagging_counts[i] / max_count) * (classes.size - 1)).round
      yield tag, classes[index]
    end
  end

end
