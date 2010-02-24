class Sharing < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

  belongs_to :shareable, :polymorphic => true

  named_scope :hot, :conditions => ["created_at > ?", 2.weeks.ago.to_s(:db)], :order => "digs_count DESC"

  named_scope :recent, :conditions => ["created_at >?", 2.weeks.ago.to_s(:db)], :order => "created_at DESC"

  acts_as_commentable :order => 'created_at ASC', :recipient_required => false

  acts_as_resource_feeds

  acts_as_diggable

  attr_readonly :poster_id, :shareable_id, :shareable_type

  validates_presence_of :poster_id, :message => "不能为空", :on => :create

  validates_presence_of :shareable_id, :shareable_type, :message => "不能为空", :on => :create

  validate_on_create :shareable_is_valid

protected

  def shareable_is_valid
    return if shareable_id.blank? or shareable_type.blank? or poster_id.blank?
    
    shareable = shareable_type.camelize.constantize.find(shareable_id)
    if shareable.blank?
      errors.add(:shareable, '不存在')
    elsif shareable.shared_by? poster
      errors.add(:shareable, '已经分享过了')
    end
  end

end
