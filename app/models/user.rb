class User
  include Mongoid::Document

  field :email, :type => String
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String

  class << self
    def create_from_facebook_auth(data)
      user = find_or_create_by(:provider => "facebook", :uid => data["uid"])
      user.name = data["user_info"]["name"]
      user.email = data["user_info"]["email"]
      user.save
      user
    end
  end

end
