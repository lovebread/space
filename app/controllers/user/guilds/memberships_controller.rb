class User::Guilds::MembershipsController < UserBaseController

  layout 'app'

  def index
		if params[:type].to_i == 0
			@memberships = @guild.memberships.find(:all, :conditions => {:status => [Membership::Veteran, Membership::Member]})
    elsif params[:type].to_i == 1
      @memberships = @guild.invitations
    elsif params[:type].to_i == 2
			@memberships = @guild.requests
		end
  end

  def edit
    render :action => 'edit', :layout => false  
  end
  
  def update
    old_status = @membership.status
    if @membership.update_attributes(:status => params[:status])
      render :update do |page|
        page << "facebox.close();"
        if old_status != @membership.status
          page << "$('membership_#{@membership.id}').remove();"
        end
      end
    else
      render :update do |page|
        page << "$('error').innerHTML = '错误'"
      end
    end 
  end

  def destroy
    if @membership.destroy
      render :update do |page|
        page << "$('membership_#{@membership.id}').remove();"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def search
		if params[:type].to_i == 0
      @memberships = @guild.memberships.find(:all, :conditions => {:status => [Membership::Veteran, Membership::Member]})
    elsif params[:type].to_i == 1
      @memberships = @guild.invitations
    elsif params[:type].to_i == 2
      @memberships = @guild.requests
    end
    @memberships = @memberships.find_all {|m| m.character.name.starts_with?(params[:key]) }
    logger.error "共有: #{@memberships.count}"
    if params[:type].to_i == 1
			render :partial => 'invitees', :locals => {:memberships => @memberships}
    elsif params[:type].to_i == 2
			render :partial => 'requestors', :locals => {:memberships => @memberships}
    else
			render :partial => 'members', :locals => {:memberships => @memberships}
    end
	end
 
protected

  def setup
    if ['index', 'search'].include? params[:action]
      @guild = Guild.find(params[:guild_id])
      @user = @guild.president
    elsif ['edit', 'update', 'destroy'].include? params[:action]
      @guild = current_user.guilds.find(params[:guild_id])
      @membership = @guild.memberships.find(params[:id])
    end
  rescue
    not_found
  end

end
