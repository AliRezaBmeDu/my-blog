class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.all[0]
    @current_user
  end

  helper_method :current_user
end
