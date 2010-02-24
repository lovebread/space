# 1 表示 所有人能
# 2 表示 好友或相同游戏才能
# 3 表示 好友才能
class PrivacySetting

  include ActsAsSetting

	acts_as_setting :bits => 2,
									:defaults => %w[2 2 2 2 3 3 3 3 1 1 1 1 2 1],
									:attributes => %w[personal basic_info character_info wall qq phone website email poke friend search send_mail leave_wall_message add_me_as_friend]


  attributes.each do |attribute|
    define_method("#{attribute}_viewable_by?") do |user|
      @instance == user || eval("#{attribute}") == 1 || @instance.has_friend?(user) || (eval("#{attribute}") == 2 and @instance.has_same_game_with?(user))
    end
  end

end
