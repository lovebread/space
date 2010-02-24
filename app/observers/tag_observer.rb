class TagObserver < ActiveRecord::Observer

  def before_update tag
    if tag.name_changed?
      tag.verified = 0
    end
  end

end