module RoleRequirementSystem
  
  def self.included(recipient)

    recipient.class_eval do
      include RoleRequirementSystem::InstanceMethods
    end

    recipient.extend(RoleRequirementSystem::ClassMethods)

  end

  module ClassMethods
  
    def require_role name, opts={}
      before_filter opts do |c| 
        c.check_roles [name]
      end
    end

    def require_roles names, opts={}
      before_filter opts do |c| 
        c.check_roles names
      end
    end

  end

  module InstanceMethods
  
    def check_roles names
      current_user.has_roles?(names) || role_denied 
    end

    def role_denied
      render :template => 'not_found', :layout => false
    end

  end

end
