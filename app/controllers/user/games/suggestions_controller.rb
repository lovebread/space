class User::Games::SuggestionsController < UserBaseController

  def new
  end

  def create
    @game.deliver_feeds :recipients => @recipients
    render :update do |page|
      page << "tip('已经成功');"
    end
  end

protected

  def setup
    if ["new"].include? params[:action]
      @game = Game.find(params[:game_id])
    elsif ["create"].include? params[:action]
      @game = Game.find(params[:game_id])
      @recipients = current_user.friends.find(params[:ids])
    end
  rescue
    not_found
  end

end
