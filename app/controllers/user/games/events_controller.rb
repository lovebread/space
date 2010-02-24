class User::Games::EventsController < UserBaseController

  layout 'app'

  def index
    @events = @game.events.paginate :page => params[:page], :per_page => 10
  end

protected

  def setup
    @game = Game.find(params[:game_id])
    @user = current_user
  rescue
    not_found
  end

end
