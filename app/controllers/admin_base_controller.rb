class AdminBaseController < ApplicationController

  layout 'admin'

  require_login

  require_role 'admin'

  before_filter :setup

  def setup
    # override this method in child controller
  end
  
  def succ
    render :update do |page|
      page << "notice('操作成功！');"
      page.redirect_to :back
    end
  end
  
  def err
    render :update do |page|
      page << "error('发生错误');"
      page.redirect_to :back
    end
  end
  
end
