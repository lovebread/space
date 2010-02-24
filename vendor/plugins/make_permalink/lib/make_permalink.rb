module MakePermalink #:nodoc:
  def self.included(base)
    base.extend ClassMethods
  end
end

module ClassMethods
  # Creates a permalink for a given object based on the attribute passed as
  # parameter:
  #     
  #   class Post < ActiveRecord::Base
  #     make_permalink :title
  #   end
  #
  #   p = Post.create(:title => "Hello World!")
  #   p.permalink   # => "1-hello-world"
  def make_permalink(method)
    define_method "permalink" do 
      field = self.send(method.to_sym) 
      link = "#{id}-#{field.gsub(/[^\w]+/, "-").downcase}"
      link.gsub(/-$/, "")       # remove trailing dashes
    end
  end
end





