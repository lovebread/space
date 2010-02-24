class AdminBaseController < ApplicationController

  layout 'admin'

  require_login

  require_role 'admin'

  before_filter :setup

  def setup
    # override this method in child controller
  end

end
