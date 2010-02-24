class AddUsers < ActiveRecord::Migration
  def self.up
    user = User.new
    user.login = '高下红'
    user.password = '111111'
    user.password_confirmation = '111111'
    user.email = 'gaoxh04@gmail.com'
    user.gender = 'male'
    user.save(false)
    puts "activating"
    user.activate
    puts "activated"
    user = User.new
    user.login = '谢心'
    user.password = '111111'
    user.password_confirmation = '111111'
    user.email = 'xiexinwang@gmail.com'
    user.gender = 'male'
    user.save(false)
    user.activate
    user = User.new
    user.login = '明非'
    user.password = '111111'
    user.password_confirmation = '111111'
    user.email = 'gaoxiahong1020@yahoo.com.cn'
    user.gender = 'male'
    user.save(false)
    user.activate
    50.times do |i|
      user = User.new
      user.login = "用户#{i}"
      user.password = '111111'
      user.password_confirmation = '111111'
      user.email = "user#{i}@gmail.com"
      user.gender = 'male'
      user.save(false)
      user.activate
    end
  
  end

  def self.down
  end
end
