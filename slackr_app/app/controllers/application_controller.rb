class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # This allows us to call current_user in our views
  helper_method :current_user

  # Allows us to check for a logged in user
  def authorize
    redirect_to '/login' unless current_user
  end




  
end
