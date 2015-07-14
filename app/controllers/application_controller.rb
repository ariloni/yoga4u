class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #makes current user available to ALL Controllers.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #RecordNotFound exception raised by ActiveRecord
    rescue ActiveRecord::RecordNotFound
  end
  # makes current user available in every view
  helper_method :current_user
end
