class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_owned? 

  protected

  def user_owned?(user_id)
    current_user && current_user.id == user_id 
  end
end
