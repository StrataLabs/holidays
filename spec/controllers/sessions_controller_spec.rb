require 'spec_helper'

describe SessionsController do
  describe "log in via facebook" do
    before(:each) do
      request.env["omniauth.auth"] = { "provider" => "facebook", "uid" => "uid", "user_info" => { "name" => "Full Name", "email" => "foo@bar.com" } }
    end

    it "creates a user from facebook OAuth" do
      get :facebook
      user = User.first(:conditions => {:provider => "facebook", :uid => "uid"})
      user.name.should == "Full Name"
    end

    it "redirects to the url defined by omniauth" do
      request.env["omniauth.origin"] = "/foo/bar"
      get :facebook
      response.should redirect_to("/foo/bar")
    end

    it "redirects back to root if no origin is specified" do
      get :facebook
      response.should redirect_to("/")
    end
  end
end
