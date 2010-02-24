class User::Games::AttentionsController < UserBaseController

  def create
    @attention = @game.attentions.build(:user_id => current_user.id)
    unless @attention.save
			render :update do |page|
				page << "error('发生错误，稍后再试');"
			end
		end
	end 
    
  def destroy
    unless @attention.destroy
      render :update do |page|
		    page << "error('发生错误');"
      end
    end
  end
  
protected

  def setup
    if ["index"].include? params[:action]
		elsif ["create"].include? params[:action]
      @game = Game.find(params[:game_id])
    elsif ["destroy"].include? params[:action]
      @attention = current_user.game_attentions.find(params[:id])
      @user = @attention.user # this is required by owner_required
    end
  rescue
    not_found
  end

end
