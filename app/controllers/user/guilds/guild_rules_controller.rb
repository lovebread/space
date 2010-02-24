class User::Guilds::GuildRulesController < UserBaseController

	layout 'app'

	def index
		@guild = Guild.find(params[:guild_id])
    case params[:type].to_i
		when 1
      render :partial => 'edit_basic_rule'
    when 2
      render :partial => 'edit_attendance_rule'
    end
	end

	def new
		@guild = Guild.find(params[:guild_id])
		@guild_rule = GuildRule.new
		render :partial => 'new_basic_rule'
	end

	def create
		@guild = Guild.find(params[:guild_id])
		@guild.guild_rules.build(params[:guild_rule])
		if @guild.save
			@guild = Guild.find(params[:guild_id])
			respond_to do |format|
				format.json {render :json => @guild}
				format.html {render :partial => 'basic_rule'}
			end
		end
	end

	def update_rules
		@guild = Guild.find(params[:guild_id])
		if @guild.update_attributes(params[:guild])
			@guild = Guild.find(params[:guild_id])
			respond_to do |format|
				format.json { render :json => @guild }
				format.html {
					case params[:type].to_i
					when 1
						render :partial => 'basic_rule'
					when 2
						render :partial => 'attendance_rule'
					end
				}
			end
		end
	end

end
