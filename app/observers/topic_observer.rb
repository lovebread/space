class TopicObserver < ActiveRecord::Observer

  def after_create topic
    topic.forum.raw_increment :topics_count
  end

  def after_destroy topic
    topic.forum.raw_decrement :topics_count
  end

end
