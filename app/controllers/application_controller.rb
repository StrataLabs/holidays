class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.where(:_id => session[:user_id]).first
  end

  def mongo_ids_valid?(hash)
    hash.all? { |id, clazz| clazz.exists? :conditions => {:_id => id } }
  end

  def redirect_if_not_logged_in
    if current_user.nil?
      redirect_to root_path
    end
  end
end
