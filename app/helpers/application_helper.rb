module ApplicationHelper
  def authorize_path(provider, origin)
    "#{root_path}auth/#{provider}?origin=#{origin}"
  end
end
