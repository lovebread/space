# ActsAsPinyin
require 'rubygems'
require 'icu4r'

module Pinyin

  HANZI_UNICODE_START = 19968 

  HANZI_UNICODE_END = 40869

  def acts_as_pinyin options={}
    define_method("before_create") do
      options.each do |column, pinyin_column|
        str = eval("self.#{column}.u")
        pinyin = ""
        str.each do |ch|
          cp = ch.codepoints[0]
          if cp >= HANZI_UNICODE_START and cp <= HANZI_UNICODE_END
            # why do we need to_s here???
            record = ChineseCharacter.find_by_utf8_code(ch.to_s)
            if record.nil?
              pinyin << "?"
            else
              pinyin << record.pinyin
            end
          else
            pinyin << ch
          end
        end
        eval("self.#{pinyin_column} = pinyin")
      end
    end
  end

end

ActiveRecord::Base.extend(Pinyin)
