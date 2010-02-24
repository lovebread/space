class GameProfessionObserver < ActiveRecord::Observer

  def after_create profession
    profession.game.raw_increment :professions_count
  end

  def after_destroy profession
    profession.game.raw_decrement :professions_count
  end

end
