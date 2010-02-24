class Admin::PollsController < AdminBaseController

  def index
    @polls = Poll.unverified.paginate :page => params[:page], :per_page => 20
  end

  def accept
    @polls = Poll.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @polls = Poll.reject.paginate :page => params[:page], :per_page => 20
  end

  def show
  end

  def destroy
  end

  # accept
  def verify
    @poll.verified = 1
    if @poll.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @poll.verified = 2
    if @poll.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @poll = Poll.find(params[:id])
    end
  rescue
    not_found
  end
  
end