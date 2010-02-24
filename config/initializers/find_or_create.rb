class << ActiveRecord::Base

	def find_or_create attrs
    record = self.find(:first, :conditions => attrs)
    if !record.blank?
      record
    else
      self.create(attrs)
    end
  end

  def find_or_create! attrs
    record = self.find(:first, :conditions=> attrs)
    if !record.blank?
      record
    else
      record = self.new(attrs)
      record.save!
    end
  end

end
