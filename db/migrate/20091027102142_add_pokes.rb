class AddPokes < ActiveRecord::Migration
  def self.up
		Poke.new(:name => '打招呼', :path => '/images/pokes/hi.png').save
    Poke.new(:name => '握手', :path => '/images/pokes/shake.png').save
    Poke.new(:name => '错一下', :path => '/images/pokes/cuo.png').save
    Poke.new(:name => '胜利', :path => '/images/pokes/victory.png').save
    Poke.new(:name => '给一拳', :path => '/images/pokes/punch.png').save
    Poke.new(:name => '微笑', :path => '/images/pokes/smile.png').save
    Poke.new(:name => '色迷迷', :path => '/images/pokes/se.png').save
    Poke.new(:name => '抛媚眼', :path => '/images/pokes/mei.png').save
    Poke.new(:name => '摸摸头', :path => '/images/pokes/touch.png').save
    Poke.new(:name => '飞吻', :path => '/images/pokes/kiss.png').save
    Poke.new(:name => '电一下', :path => '/images/pokes/bolt.png').save
    Poke.new(:name => '踩一下', :path => '/images/pokes/cai.png').save
  end

  def self.down
  end
end
