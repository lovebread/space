require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :all

  def setup
    @game = Game.find(1)
    @poster = User.find(1)
    @news_type = "文字"
    @data = "<a href=\"http://info.tsinghua.edu.cn\">sb2</a>"
    @params = {:game_id => @game.id, :poster_id => @poster.id, :news_type => @news_type, :data => @data }
  end

  test "保存新闻，新闻数加1" do
    @news = News.create(@params)
  #  @news.save!
   # reload
     assert_equal Game.find_by_id(1).news[0].data, @data.to_s
    # assert_equal News.find_by_id(1).id 1
  end
# test validate
  test "没有游戏" do
    @news = News.create(@params.merge({:game_id => nil }))
    assert_equal @news.errors.on_base, "没有游戏"
  end
  
  test "游戏不存在" do
    @news = News.create(@params.merge({:game_id =>101 }))
    assert_equal @news.errors.on_base, "游戏不存在"
  end

  test "没有新闻种类" do
    @news = News.create(@params.merge({:news_type => nil}))
    assert_equal @news.errors.on_base, "没有新闻种类"
  end

  test "没有内容" do
    @news = News.create(@params.merge({:data => nil}))
    assert_equal @news.errors.on_base, "没有内容"
  end
# test update
  test "更新新闻，game_id变为2" do
    @news = News.create(@params)
    @news.update_attributes(:game_id => 2)
    @game.reload
    @game2 = Game.find(2)
    assert_equal @game.news.length, 0
    assert_equal @game2.news.length, 1
  end

  test "更新poster_id" do 
    @news = News.create(@params)
    reload
    @news.update_attributes(:poster_id => 2)
    @news.reload
    assert_equal @news.poster_id, 1 
  end

  test "更新game_id为nil" do
    @news = News.create(@params)
    @news.update_attributes(:game_id => nil)
    reload
    @news.reload
    assert_equal @news.errors.on_base, "没有游戏"
  end

  private
  def reload
    @game.reload  
  end
end
