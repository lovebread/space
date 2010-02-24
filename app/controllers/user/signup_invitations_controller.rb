class User::SignupInvitationsController < UserBaseController

  layout 'app'

  def new
    @invitation = SignupInvitation.new
  end

  def create
    invitation_params = params[:invitation].merge({:sender_id => current_user.id})
    @invitation = SignupInvitation.new(invitation_params)
    
    if @invitation.save
      render :update do |page|
        if params[:invitation][:qq]
          page << "$('qq_invite').innerHTML = '发送成功';"
        else
          page << "$('email_invite').innerHTML = '发送成功';"
        end
      end
    else
      render :update do |page|
        if params[:invitation][:qq]
          page << "$('qq_invite').innerHTML = '#{@invitation.errors.on_base}';"
        else
          page << "$('email_invite').innerHTML = '#{@invitation.errors.on_base}';"
        end
      end
    end
  end

end
