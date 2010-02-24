module User::EventsHelper

  def show_event_status participation, event
    if participation.blank?
      if event.participantable? current_user
        return "<span id='event_status_#{event.id}'>没有参加</span><span id='reply_event_#{event.id}'>(#{facebox_link '请求加入', new_event_request_url(event)})</span>"
      else
        return "<span id='event_status_#{event.id}'>只有#{get_subject event.poster}的好友才能参加</span>"
      end
    elsif participation.is_invitation?
      "<span id='event_status_#{event.id}'>受邀请</span><span id='reply_event_#{event.id}'>(#{facebox_link '回复', edit_event_invitation_url(event, participation, :show => 0)})</span>"
    elsif participation.is_request?
      "<span id='event_status_#{event.id}'>等待回复</span><span id='reply_#{event.id}'></span>"
    elsif participation.is_authorized?
      "<span id='event_status_#{event.id}'>#{participation.to_s}</span><span id='reply_event_#{event.id}'>(#{facebox_link '更改', edit_event_participation_url(event, participation, :show => 0)})</span>"
    end
  end

end
