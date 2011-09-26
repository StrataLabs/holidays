class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.where(:_id => session[:user_id]).first
  end

  def redirect_if_not_logged_in
    if current_user.nil?
      redirect_to root_path
    end
  end

  def validate_ids_in_params
    validator = MongoidIdValidator.new(self.class.name.gsub("Controller", "").singularize)
    invalid = validator.first_invalid(params)
    if invalid
      render :status => :unprocessable_entity, :text => "Invalid #{invalid}"
    end
  end
end
