class UserBaseController < ApplicationController

  include PrivilegeSystem

  include RoleRequirementSystem

  def user_game_conds
    {:game_id => current_user.characters.map(&:game_id).uniq}
  end

  before_filter :login_required, :setup

  def setup
    # override this method in child controller
  end

end
