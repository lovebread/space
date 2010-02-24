class User::Guilds::RulesController < UserBaseController

  def index
    case params[:type].to_i
    when 0
      render :partial => 'edit_attendance_rules'
    when 1
      render :partial => 'edit_basic_rules'
    end   
  end

  def new
    @rule = GuildRule.new
  end

  def create
    rule_params = (params[:rule] || {}).merge({:type => 2, :guild_id => @guild.id})
    @rule = Guild.new(rule_params)
    if @rule.save
      render :json => @rule
    end
  end

  # create new rules, or update existing rules 
  def create_or_update
    if @guild.update_attributes(params[:guild])
      @guild.reload
      if params[:type].to_i == 0
        render :partial => 'attendance_rules', :locals => {:guild => @guild}
      elsif params[:type].to_i == 1
        render :partial => 'basic_rules', :locals => {:guild => @guild}
      end
    else
      flash[:error] = "发生错误"
      redirect_to edit_guild_rules(@guild)
    end
  end

  def destroy
    if @rule.destroy
      render :partial => 'basic_rules', :locals => {:guild => @guild}
    else
      render :update do |page|
        page << "error('发生错误，无法删除')"
      end
    end
  end

protected

  def setup
    if ["index", "new", "create_or_update"].include? params[:action]
      @guild = current_user.guilds.find(params[:guild_id])
    elsif ["destroy"].include? params[:action]
      @guild = current_user.guilds.find(params[:guild_id])
      @rule = @guild.basic_rules.find(params[:id])
    end
  rescue
    not_found
  end

end
