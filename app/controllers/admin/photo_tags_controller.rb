class Admin::PhotoTagsController < AdminBaseController

  def index
    @photo_tags = Photo_tag.unverified.paginate :page => params[:page], :per_page => 20
  end
  
  def accept
    @photo_tags = Photo_tag.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @photo_tags = Photo_tag.reject.paginate :page => params[:page], :per_page => 20
  end

  def show
  end

  def destroy
  end

  # accept
  def verify
    @photo_tag.verified = 1
    if @photo_tag.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @photo_tag.verified = 2
    if @photo_tag.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @photo_tag = Photo_tag.find(params[:id])
    end
  rescue
    not_found
  end
  
end