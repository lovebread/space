class Poll < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

  belongs_to :game

  has_many :answers, :class_name => 'PollAnswer', :dependent => :destroy

  has_many :votes, :dependent => :destroy

  has_many :voters, :through => :votes

	has_many :invitations, :class_name => 'PollInvitation', :dependent => :destroy, :order => 'created_at DESC'

  named_scope :hot, :conditions => ["created_at > ? AND ((no_deadline = 0 AND deadline > ?) OR no_deadline = 1)", 2.weeks.ago.to_s(:db), Time.now.to_s(:db)], :order => "voters_count DESC"

  named_scope :recent, :conditions => ["created_at > ? AND ((no_deadline = 0 AND deadline > ?) OR no_deadline = 1)", 2.weeks.ago.to_s(:db), Date.today.to_s(:db)], :order => 'created_at DESC'

  acts_as_diggable

  acts_as_shareable
  
	acts_as_commentable :order => 'created_at ASC', 
                      :delete_conditions => lambda {|user, poll, comment| poll.poster == user || comment.poster == user}

  acts_as_resource_feeds

  acts_as_random
  
  attr_readonly :poster_id, :game_id, :no_deadline

  validates_presence_of :poster_id, :message => "不能为空", :on => :create

  validates_presence_of :name, :message => "不能为空"

  validates_size_of :name, :within => 1..100, :too_long => "最长100个字节", :too_short => "最短1个字节"

  validates_size_of :description, :within => 0..5000, :too_long => "最长5000个字节", :allow_nil => true

  validates_size_of :explanation, :within => 0..5000, :too_long => "最长5000个字节", :allow_nil => true

  validates_presence_of :game_id, :message => "不能为空", :on => :create

  validate_on_create :game_is_valid

  validates_presence_of :deadline, :message => "不能为空", :if => "!no_deadline"

  validate_on_create :deadline_is_valid

  def past
    !self.no_deadline and self.deadline < Time.now.to_date
  end

  def is_votable_by? user
    user == poster || privilege == 1 || (privilege == 2 and poster.friends.include? user)
  end

  def answers=(answer_attributes)
    @answer_attributes = answer_attributes.find_all {|a| !a[:description].blank?}
  end

  after_save :save_answers

  def save_answers
    unless @answer_attributes.blank?
      @answer_attributes.each { |answer_attribute| answers.create(answer_attribute) }
      @answer_attributes = nil
    end
  end 

protected

  def game_is_valid
    return if game_id.blank?
    errors.add('game_id', "不存在") unless Game.exists?(game_id)
    return if poster_id.blank?
    errors.add('game_id', "该用户没有这个游戏") unless poster.characters.map(&:game_id).include?(game_id)
  end

  def deadline_is_valid 
    return if no_deadline or deadline.blank?
    errors.add(:deadline, "截止时间不能比现在早") if deadline <= Time.now.to_date
  end

end


