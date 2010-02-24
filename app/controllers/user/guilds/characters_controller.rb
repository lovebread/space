class User::Guilds::CharactersController < UserBaseController

  def index
    @characters = @guild.characters_for current_user
    render :json => @characters
  end

protected

  def setup
    @guild = Guild.find(params[:guild_id])
  rescue
    not_found
  end

end
