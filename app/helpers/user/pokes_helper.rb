module User::PokesHelper

  def poke_action delivery
    poke = delivery
    sender = delivery.sender
    case poke.id
    when 1
      "#{profile_link sender} 向你打招呼"
    when 2
      "#{profile_link sender} 和你握手"
    when 3
      "#{profile_link sender} 戳你一下"
    when 4
      "#{profile_link sender} 向你摆胜利姿势"
    when 5
      "#{profile_link sender} 打你一拳"
    when 6
      "#{profile_link sender} 向你微笑"
    when 7
      "#{profile_link sender} 色迷迷的看着你"
    when 8
      "#{profile_link sender} 向你抛媚眼"
    when 9
      "#{profile_link sender} 摸着你的头"
    when 10
      "#{profile_link sender} 送来飞吻"
    when 11
      "#{profile_link sender} 送来一道闪电"
    when 12
      "#{profile_link sender} 踩你一脚"
    end
  end

end
