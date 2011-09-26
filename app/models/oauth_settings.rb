class OauthSettings < Settingslogic
  source "#{Rails.root}/config/oauthkeys.yml"
  namespace Rails.env
end
