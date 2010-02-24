class RatingObserver < ActiveRecord::Observer

  def after_save rating
    # reset average
    rateable = rating.rateable
    rateable.update_attribute('average_rating', rateable.ratings.average(:rating))  
    
    # increment counter
    rating.rateable.raw_increment :ratings_count
  end

  def after_destroy rating
    rating.rateable.raw_decrement :ratings_count
  end

end
