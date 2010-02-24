class Tag < ActiveRecord::Base

	has_many :taggings, :dependent => :destroy

	named_scope :game_tags, :conditions => {:taggable_type => 'Game'}

	named_scope :profile_tags, :conditions => {:taggable_type => 'Profile'}

  acts_as_pinyin :name => "pinyin"

  searcher_column :pinyin, :name

  attr_readonly :name, :taggable_type

  validates_presence_of :name, :message => "不能为空"

  validates_size_of :name, :within => 1..100, :too_short => "最短1个字节", :too_long => "最长100个字节"

  validates_presence_of :taggable_type, :message => "不能为空"

  validates_uniqueness_of :name, :scope => :taggable_type, :message => "已经有了", :if => "!name.blank? and !taggable_type.blank?"

end
