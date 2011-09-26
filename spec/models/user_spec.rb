require 'spec_helper'

describe User do
  describe "created from facebook auth" do
    let(:facebook_hash) { { "uid" => "foo", "user_info" => { "name" => "Name", "email" => "foo@bar.com"} }  }

    it "parses properties from facebook auth" do
      User.create_from_facebook_auth(facebook_hash)
      user = User.find_or_create_by(:uid => "foo", :provider => :facebook)
      user.name.should == "Name"
      user.email.should == "foo@bar.com"
    end

    it "saves the new user if the user is logging in for the first time" do
      lambda {
        User.create_from_facebook_auth(facebook_hash)
      }.should change(User, :count).by(1)
    end

    it "modifies the existing user on second login" do
      Factory(:user, :uid => "foo", :provider => :facebook)
      lambda {
        User.create_from_facebook_auth(facebook_hash)
      }.should_not change(User, :count)
      user = User.find_or_create_by(:uid => "foo", :provider => :facebook)
      user.name.should == "Name"
    end
  end

  it "is valid when created by the factory" do
    Factory.build(:user).should be_valid
  end
end
