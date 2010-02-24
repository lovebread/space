class AddFriends < ActiveRecord::Migration
  def self.up
    gaoxh = User.find_by_email('gaoxh04@gmail.com')
    xiexin = User.find_by_email('xiexinwang@gmail.com')
    micai = User.find_by_email('gaoxiahong1020@yahoo.com.cn')
    gaoxh.friendships.create(:friend_id => xiexin.id)
    gaoxh.friendships.create(:friend_id => micai.id)
    30.times do |i|
      user = User.find_by_email("user#{i}@gmail.com")
      gaoxh.friendships.create(:user_id => gaoxh.id, :friend_id => user.id)
      user.friendships.create(:user_id => user.id, :friend_id => gaoxh.id)
    end
    micai.friendships.create(:friend_id => gaoxh.id)
    micai.friendships.create(:friend_id => xiexin.id)
    30.times do |i|
      user = User.find_by_email("user#{i}@gmail.com")
      micai.friendships.create(:friend_id => user.id)
      user.friendships.create(:user_id => user.id, :friend_id => micai.id)
    end
  end

  def self.down
  end
end
