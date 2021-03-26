class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize_all
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to root_path
    end
  end

  def authorize_users
    if !current_user
      flash[:alert] = "You must be signed in to perform that action."
      redirect_to signin_path
    end
  end

  def authorize_admins
    unless current_user && current_user.admin
      flash[:alert] = "You must be signed in as administrator to perform that action."
      redirect_to signin_path 
    end
  end
end
