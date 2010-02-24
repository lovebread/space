class Admin::VideosController < AdminBaseController

  def index
    @videos = Video.unverified.paginate :page => params[:page], :per_page => 20
  end

  def accept
    @videos = Video.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @videos = Video.reject.paginate :page => params[:page], :per_page => 20
  end

  def show
  end

  def destroy
  end

  # accept
  def verify
    @video.verified = 1
    if @video.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @video.verified = 2
    if @video.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @video = Video.find(params[:id])
    end
  rescue
    not_found
  end
  
end
