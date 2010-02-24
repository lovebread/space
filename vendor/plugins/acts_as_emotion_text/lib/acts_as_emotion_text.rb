# ActsAsEmotionText

module Emotion

  Symbols = ['[-_-]', '[@o@]', '[-|-]', '[o_o]', '[ToT]', '[*_*]']

	ImagePaths = ['/faces/0.gif', '/faces/1.gif', '/faces/2.gif', '/faces/3.gif', '/faces/4.gif', '/faces/5.gif']

  def acts_as_emotion_text(options={})
    define_method("before_create") do
      options[:columns].each do |column|
        Symbols.each_with_index do |s, i|
          eval("self.#{column}").gsub!("#{s}", "<img src='#{ImagePaths[i]}'/>")
        end
      end
    end
  end

end

ActiveRecord::Base.extend(Emotion)
