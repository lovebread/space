class RegisterController < ApplicationController

	def new_character
	  @games = Game.find(:all, :order => 'pinyin ASC')
  end

  def validates_email_uniqueness
    if User.find_by_email(params[:email])
      render :text => 'no'
    else
      render :text => 'yes'
    end
  end

  def invite
    @invitation = SignupInvitation.find_by_token(params[:token])
    if @invitation.blank?
      @sender = User.find_by_invite_code(params[:token])
    else
      @sender = @invitation.sender
    end
    if @sender.blank?
      render :text => "非法的连接"
    else
      @friends = @sender.friends[0..11]
      render :action => 'invite'  
    end
  end

end
