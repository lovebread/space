class Vote < ActiveRecord::Base

	serialize :answer_ids, Array

  belongs_to :voter, :class_name => 'User'

  belongs_to :poll#, :counter_cache => :voters_count

	acts_as_resource_feeds

	def answers
		PollAnswer.find(answer_ids)
	end

  attr_readonly :voter_id, :poll_id, :answer_ids

  validates_presence_of :voter_id, :message => "不能为空"

  validates_presence_of :poll_id, :message => "不能为空"

  validate_on_create :poll_is_valid

  validates_presence_of :answer_ids, :message => "不能为空"

  validate_on_create :answers_are_valid

protected

  def poll_is_valid
    return if poll_id.blank?
    poll = Poll.find(:first, :conditions => {:id => poll_id})
    if poll.blank?
      errors.add(:poll_id, "不存在")
    elsif poll.past
      errors.add(:poll_id, "已经过期")
    elsif !poll.is_votable_by? voter
      errors.add(:poll_id, "没有权限")
    elsif poll.voters.include? voter
      errors.add(:poll_id, "已经投过了")
    end
  end

  def answers_are_valid
    return if answer_ids.blank? or poll.blank?
    if poll.max_multiple < answer_ids.count
      errors.add(:answer_ids, "选太多了")
    else
      poll.answers.find(answer_ids)
    end
  rescue
    errors.add_to_base("选项不存在")
  end

end
