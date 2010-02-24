# comment, photo_tag, friend_tag会产生一些notice
# 这些notice会显示在主页上
class Notice < ActiveRecord::Base

	belongs_to :producer, :polymorphic => true # only for comment, and tag

	belongs_to :user

	named_scope :unread, :conditions => {:read => false}

	def has_same_source_with? notice
		return false if producer_type != notice.producer_type
		if producer_type == 'Comment'
			(producer.commentable_id == notice.producer.commentable_id) and (producer.commentable_type == notice.producer.commentable_type)
		elsif producer_type == 'FriendTag'
			(producer.taggable_id == notice.producer.taggable_id) and (producer.taggable_type == notice.producer.taggable_type)
		elsif producer_type == 'PhotoTag'
			(producer.photo_id == notice.producer.photo_id)
		end
	end

  # 把所有same source的通知都标记为以读
  def read_by user
    notices = user.notices.unread.find_all {|n| self.has_same_source_with? n}
    Notice.update_all("notices.read = 1", {:user_id => user.id, :id => notices.map(&:id)})
    user.raw_decrement :unread_notices_count, notices.count
  end
  
end
