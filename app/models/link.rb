class Link < ActiveRecord::Base

  acts_as_shareable

  before_create :modify_url
  
  def modify_url
    unless self.url.starts_with? 'http://'
      self.url = "http://#{self.url}"
    end
  end

end
