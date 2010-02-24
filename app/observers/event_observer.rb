#
# 如果活动的时间地点发生了变化，发通知
#
require 'app/mailer/event_mailer'

class EventObserver < ActiveRecord::Observer

  def before_create event
    if event.is_guild_event?
      g = event.guild
      event.game_id = g.game_id
      event.game_server_id = g.game_server_id
      event.game_area_id = g.game_area_id
    else
      c = event.poster_character
      event.game_id = c.game_id
      event.game_server_id = c.server_id
      event.game_area_id = c.area_id
    end
  end

  def after_create event
    # create album
    event.create_album

    # create participation
    event.participations.create(:participant_id => event.poster_id, :character_id => event.character_id, :status => Participation::Confirmed)

    # increment user's counter
    event.poster.raw_increment :events_count
 
    # issue feeds
    return unless event.poster.application_setting.emit_event_feed
    recipients = [event.poster.profile, event.game]
    recipients.concat event.poster.guilds
    recipients.concat event.poster.friends.find_all{|f| f.application_setting.recv_event_feed}
    event.deliver_feeds :recipients => recipients
  end

  def after_update event
    if event.time_changed?
      event.participants.each do |participant|
        participant.notifications.create(:category => Notification::EventChange, :data => "活动 #{event_link event} 时间改变了")
        EventMailer.deliver_time_change event, participant if participant.mail_setting.change_event
      end
    end
  end

  def before_destroy event
    event.poster.raw_decrement :events_count
    event.poster.raw_decrement :event_requests_count, event.requests_count

    event.memberships.each do |m|
      if m.is_invitation?
        m.participant.raw_decrement :event_invitations_count
      elsif m.is_request?
        m.participant.notifications.create(:data => "活动 #{event_link event} 被取消了，你的请求作废了", :category => Notification::EventCancel)
      elsif m.is_authorized? and m != event.poster
        m.participant.raw_decrement :upcoming_events_count
        m.participant.notifications.create(:data => "活动 #{event_link event} 被取消了", :category => Notification::EventCancel)
      end
    end
  end

end
