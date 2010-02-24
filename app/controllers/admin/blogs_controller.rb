class Admin::BlogsController < AdminBaseController

  def index
    @blogs = Blog.unverified.paginate :page => params[:page], :per_page => 20
  end
  
  def accept
    @blogs = Blog.accept.paginate :page => params[:page], :per_page => 20
  end
  
  def reject
    @blogs = Blog.reject.paginate :page => params[:page], :per_page => 20
  end

  def show
  end

  def destroy
  end

  # accept | succ and err are defined in admin_base_controller.rb
  def verify
    @blog.verified = 1
    if @blog.save
      succ
    else
      err
    end
  end
  
  # reject
  def unverify
    @blog.verified = 2
    if @blog.save
      succ
    else
      err
    end
  end
  
  
protected

  def setup
    if ["show", "destroy", "verify", "unverify"].include? params[:action]
      @blog = Blog.find(params[:id])
    end
  rescue
    not_found
  end
  
end
