module ObserverHelperMethods
  def observer_instances
    ActiveRecord::Base.observers.collect do |observer|
      observer_klass = \
        if observer.respond_to?(:to_sym)
          observer.to_s.camelize.constantize
        elsif observer.respond_to?(:instance)
          observer
        end
      observer_klass.instance
    end
  end

  def observed_classes(observer=nil)
    observed = Set.new
    (observer.nil? ? observer_instances : [observer]).each do |observer|
      observed += (observer.send(:observed_classes) + observer.send(:observed_subclasses))
    end
    observed
  end

  def observed_classes_and_their_observers
    observers_by_observed_class = {}
    observer_instances.each do |observer|
      observed_classes(observer).each do |observed_class|
        observers_by_observed_class[observed_class] ||= Set.new
        observers_by_observed_class[observed_class] << observer
      end
    end
    observers_by_observed_class
  end

  def disable_observers(options={})
    except = options[:except]
    observed_classes_and_their_observers.each do |observed_class, observers|
      observers.each do |observer|
        unless observer.class == except
          observed_class.delete_observer(observer)
        end
      end
    end
  end

  def enable_observers(options={})
    except = options[:except]
    observer_instances.each do |observer|
      unless observer.class == except
        observed_classes(observer).each do |observed_class|
          observer.send :add_observer!, observed_class
        end
      end
    end
  end
end


