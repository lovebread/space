class Mail < ActiveRecord::Base

  attr_accessor :recipients

  belongs_to :sender, :class_name => 'User'

  belongs_to :recipient, :class_name => 'User'

	belongs_to :parent, :class_name => 'Mail'
 
  has_many :children, :class_name => 'Mail', :foreign_key => 'parent_id', :order => 'created_at ASC'

	acts_as_emotion_text :columns => [:content]

  named_scope :unread, :conditions => {:read_by_recipient => 0}

  attr_readonly :sender_id, :recipient_id, :parent_id, :content

  validates_presence_of :sender_id, :message => "不能为空"

  validates_presence_of :recipient_id, :message => "不能为空"

  validate_on_create :recipient_is_valid

  validates_presence_of :parent_id, :message => "不能为空"

  validates_presence_of :content, :message => "不能为空"

  validates_size_of :content, :within => 1..1000, :too_long => "最多1000个字节", :too_short => "最少1000个字节"

  def mark_as_deleted(user_id)
    if recipient?(user_id)
      update_attribute(:delete_by_recipient, true)
    elsif sender?(user_id)
      update_attribute(:delete_by_sender, true)
    end
  end

private

  def recipient?(user_id)
    (recipient_id == user_id)? true : false
  end

  def sender?(user_id)
    (sender_id == user_id)? true : false
  end

  def recipient_is_valid
    return if recipient_id.blank?
    errors.add(:recipient_id, "不存在") unless User.exists?(recipient_id)
  end

end
