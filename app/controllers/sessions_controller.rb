class SessionsController < ApplicationController
  def facebook
    data = request.env["omniauth.auth"]
    User.create_from_facebook_auth(data)
    redirect_to (request.env["omniauth.origin"] || root_path)
  end
end
