class User::Events::SummaryController < UserBaseController

  layout 'app'

  def show
    eval("step#{params[:step].to_i}")
  end

  def add_attendants
    @attendances = {}
    params[:character_ids].each do |id|
      @attendances["#{id}"] = {:late => false, :completeness => 50}
    end
    session[:event_summary][:attendances].merge!(@attendances)
    render :partial => 'attendance_info', :locals => {:attendances => @attendances}
  end

  def remove_attendants
    @attendances = session[:event_summary][:attendances].delete_if {|k, v| params[:character_ids].include?(k)}
    session[:event_summary][:attendances] = @attendances
    render :nothing => true
  end

  def add_bosses
    @bosses = {}
    params[:boss_ids].each do |id|
      @bosses["#{id}"] = {:count => 1}
    end
    session[:event_summary][:bosses].merge!(@bosses)
    render :partial => 'boss_info', :locals => {:bosses => @bosses}
  end

  def remove_bosses
    @bosses = session[:event_summary][:bosses].delete_if {|k, v| params[:boss_ids].include?(k)}
    session[:event_summary][:bosses] = @bosses
    render :nothing => true
  end

  def add_gears
    @gears = {}
    params[:gear_ids].each do |id|
      @gears["#{id}"] = {:cost => Gear.find(id).cost, :recipient_id => nil}
    end
    session[:event_summary][:gears].merge!(@gears)
    @participants = User.find(session[:event_summary][:attendances].keys)
    render :partial => 'gear_info', :locals => {:gears => @gears}
  end

  def remove_gears
    @gears = session[:event_summary][:gears].delete_if {|k, v| params[:gear_ids].include?(k)}
    session[:event_summary][:gears] = @gears
    render :nothing => true
  end

  def add_rewards
    @rewards = []
    params[:character_ids].each do |id|
      @rewards.push({:character_id => id, :rule_id => nil})
    end
    session[:event_summary][:rewards].concat(@rewards)
    render :partial => 'reward_info', :locals => {:rewards => @rewards}
  end

  def remove_rewards
    @rewards = session[:event_summary][:rewards].delete_if {|k, v| params[:character_ids].include?(k)}
    session[:event_summary][:rewards] = @rewards
    render :nothing => true
  end

  def save
  end

  def next
    eval("save_step#{params[:step].to_i}")
    render :update do |page|
      page.redirect_to event_summary_url(@event, :step => params[:step].to_i + 1)
    end
  end

  def prev
    eval("save_step#{params[:step].to_i}")
    render :update do |page|
      page.redirect_to event_summary_url(@event, :step => params[:step].to_i - 1)
    end
  end

protected

  def setup
    @event = Event.find(params[:event_id])
    step_range_required
    setup_session_if_not_exist
  rescue
    not_found
  end

  def clear_session
    session[:event_summary] = nil
  end

  def step_range_required
    (params[:step].to_i < 5 and params[:step].to_i > 0) || not_found
  end

  def setup_session_if_not_exist
    if session[:event_summary].blank?
      session[:event_summary] = {}
    end
    session[:event_summary][:step] = params[:step].to_i
  end

  def step1
    if session[:event_summary][:attendances].blank?
      # first time to reach step1
      session[:event_summary][:attendances] = {}
      @event.confirmed_characters.each do |c|
        session[:event_summary][:attendances]["#{c.id}"] = {:late => 0, :completeness => 50}
      end
    end
    @ids = session[:event_summary][:attendances].keys
    @lates = session[:event_summary][:attendances].values.map {|v| v[:late]}
    @completeness = session[:event_summary][:attendances].values.map {|v| v[:completeness]}
    @characters = @event.characters.find(@ids)
  end

  def save_step1
  end

  def step2
    if session[:event_summary][:attendances].blank?
      redirect_to event_summary_url(@event, :step => 1)
    else
      if session[:event_summary][:bosses].blank?
        session[:event_summary][:bosses] = {}
      end
      @boss_ids = session[:event_summary][:bosses].keys
      @boss_counts = session[:event_summary][:bosses].values.map {|v| v[:count]}
    end 
  end

  def save_step2
  end

  def step3
    if session[:event_summary][:attendances].blank?
      redirect_to event_summary_url(@event, :step => 1)
    elsif session[:event_summary][:bosses].blank?
      redirect_to event_summary_url(@event, :step => 2)
    else
      if session[:event_summary][:gears].blank?
        session[:event_summary][:gears] = []
      end
      @gear_ids = session[:event_summary][:gears].map {|v| v[:gear_id]}
      @gear_counts = session[:event_summary][:gears].map {|v| v[:count] }
      @character_ids = session[:event_summary][:gears].map {|v| v[:character_id]}
      @characters = GameCharacter.find(session[:event_summary][:attendances].keys)
    end
  end

  def save_step3
  end

  def step4
    if session[:event_summary][:attendances].blank?
      redirect_to event_summary_url(@event, :step => 1)
    elsif session[:event_summary][:bosses].blank?
      redirect_to event_summary_url(@event, :step => 2)
    elsif session[:event_summary][:gears].blank?
      redirect_to event_summary_url(@event, :step => 3)
    else
      session[:event_summary][:rewards] = []
      @rule_ids = session[:event_summary][:rewards].map {|v| v[:rule_id]}
      @rule_counts = session[:event_summary][:rewards].map {|v| v[:count]}
      @character_ids = session[:event_summary][:rewards].map {|v| v[:character_id]}
      @characters = GameCharacter.find(session[:event_summary][:attendances].keys)
    end
  end

  def save_step4
  end

end
