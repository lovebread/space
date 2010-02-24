class BossObserver < ActiveRecord::Observer

  def before_create boss
    boss.game_id = boss.guild.game_id
  end

end
