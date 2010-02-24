class GameRaceObserver < ActiveRecord::Observer

  def after_create race
    race.game.raw_increment :races_count
  end

  def after_destroy race
    race.game.raw_decrement :races_count
  end

end
