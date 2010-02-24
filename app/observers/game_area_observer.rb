class GameAreaObserver < ActiveRecord::Observer

  def after_create area
    area.game.raw_increment :areas_count
  end

  def after_destroy area
    area.game.raw_decrement :areas_count
  end

end
