class PostObserver < ActiveRecord::Observer

  # TODO: 并发的时候肯定有问题，应该从mysql的层次解决这个问题
  def before_create post
    topic = post.topic
    latest_post = topic.posts.find(:first, :order => 'floor DESC')
    if latest_post.nil?
      post.floor = 1
    else
      post.floor = latest_post.floor + 1
    end
  end

  def after_create post
    post.forum.raw_increment :posts_count
    post.topic.raw_increment :posts_count
  end

  def after_destroy post
    post.forum.raw_decrement :posts_count
    post.topic.raw_decrement :posts_count
  end

end
