class User::SearchController < UserBaseController

  layout 'app'

  def user
    @games = Game.find(:all, :order => 'pinyin ASC')
    @users = User.search(params[:key]).paginate :page => params[:page], :per_page => 16 
		@total_users = GameCharacter.search(params[:key]).group_by(&:user_id).to_a
		@key = params[:key]
  end

  def character
    cond = {}
    cond.merge!({:game_id => @game.id}) unless @game.nil? 
    cond.merge!({:area_id => @area.id}) unless @area.nil? 
    cond.merge!({:server_id => @server.id}) unless @server.nil?
    @areas = @game.areas if !@game.nil? and !@game.no_areas
    if @game.nil?
      @areas = []
      @servers = []
    elsif !@game.nil? and !@game.no_areas
      @areas = @game.areas
      @servers = @area.nil? ? [] : @area.servers
    elsif !@game.nil? and @game.no_areas
      @areas = []
      @servers = @game.servers
    end
    @games = Game.find(:all, :order => 'pinyin ASC')
		@total_users = GameCharacter.search(params[:key], :conditions => cond).group_by(&:user_id).to_a
		@key = params[:key]
    @users = @total_users.paginate :page => params[:page], :per_page => 1
  end

protected

  def setup
    if ["character"].include? params[:action]
      @game = Game.find(params[:game][:id]) unless params[:game][:id].blank?
      @area = @game.areas.find(params[:area][:id]) unless params[:area][:id].blank?
      @server = @game.servers.find(params[:server][:id]) unless params[:server][:id].blank?
    end
  rescue
    not_found
  end

end
