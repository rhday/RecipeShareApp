class ApplicationController < ActionController::Base

  #gives access to these helper methods in the views
  helper_method :current_user, :logged_in?, :redirect_if_not_logged_in, :redirect_if_logged_in

  private 

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end 

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  def redirect_if_logged_in #use this helper method to catch any open loops. VALIDATOR
    redirect_to '/' if logged_in?
  end 

end
