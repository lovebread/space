class Admin::TagsController < AdminBaseController

  def index
    @tags = Tag.unverified.paginate :page => params[:page], :per_page => 20
  end

  def accept
    @tags = Tag.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @tags = Tag.reject.paginate :page => params[:page], :per_page => 20
  end

  def show
  end

  def destroy
  end

  # accept
  def verify
    @tag.verified = 1
    if @tag.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @tag.verified = 2
    if @tag.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @tag = Tag.find(params[:id])
    end
  rescue
    not_found
  end
  
end