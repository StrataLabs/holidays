class SessionsController < ApplicationController
  def facebook
    data = request.env["omniauth.auth"]
    User.create_from_facebook_auth(data)
    render :text => "foo"
  end
end
