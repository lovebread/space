class Admin::GuildsController < AdminBaseController

  def index
    @guilds = Guild.unverified.paginate :page => params[:page], :per_page => 20
  end

  def accept
    @guilds = Guild.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @guilds = Guild.reject.paginate :page => params[:page], :per_page => 20
  end
  
  def show
  end

  def destroy
  end

  # accept
  def verify
    @guild.verified = 1
    if @guild.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @guild.verified = 2
    if @guild.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @guild = Guild.find(params[:id])
    end
  rescue
    not_found
  end
  
end