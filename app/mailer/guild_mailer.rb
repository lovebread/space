class GuildMailer < ActionMailer::Base

  def name_change	guild, member
    setup_email	member
    subject			"Dayday3 - 工会#{guild.name_was}改名字了"
		body				:user => member, :url => "#{SITE_URL}/guilds/#{guild.id}"
  end

	def invitation guild, invitation
		setup_email invitation.user
		subject		 "Dayday3 - #{guild.president.login}邀请你的游戏角色#{invitation.character.name}加入工会#{guild.name}"
		body			 :user => invitation.user, :url => "#{SITE_URL}/invitations?type=2"
	end

	def request guild, request
		setup_email guild.president
		subject		 "Dayday3 - #{request.user.login}请求让游戏角色#{request.character.name}加入工会#{guild.name}"
		body			 :user => request.user, :url => "#{SITE_URL}/requests?type=2"
	end

	def promotion guild, member, new_role, old_role
		setup_email membership.user
	end

protected

  def setup_email member
		recipients	member.email
		from				SITE_MAIL
		sent_on			Time.now
  end

end
