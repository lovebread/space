class CreateChineseCharacters < ActiveRecord::Migration
  def self.up
    create_table :chinese_characters, :force => true do |t|
      t.string :utf8_code
      t.string :pinyin
    end
    File.open('pinyin.txt') do |f|
      while str = f.gets
        str.match(/\$pinyintable\['(.*?)'\] = '(.*?)';/)
        ChineseCharacter.create(:utf8_code => $1, :pinyin => $2)
      end
    end
  end

  def self.down
    drop_table :chinese_characters
  end
end
