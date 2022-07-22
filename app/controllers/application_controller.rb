class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def current_user
    user = User.first
  end
end
