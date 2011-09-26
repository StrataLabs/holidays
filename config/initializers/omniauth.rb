Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, OauthSettings.facebook_key, OauthSettings.facebook_secret
end
