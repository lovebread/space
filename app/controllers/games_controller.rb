#
# 这个GamesController和User::GamesController虽然名字一样，但是处于不同的namespace
# 因此功能也不同，User::GamesController 主要管用户玩的游戏
#
class GamesController < ApplicationController

  before_filter :setup

  def game_details
    render :json => @game.to_json(:include => [:servers, :areas, :races, :professions])
  end

  def area_details
    render :json => @area.to_json(:include => :servers)
  end

protected

  def setup
    if ["game_details"].include? params[:action]
      @game = Game.find(params[:game_id])
    elsif ["area_details"].include? params[:action]
      @game = Game.find(params[:game_id])
      @area = @game.areas.find(params[:area_id])
    end
  end


end
