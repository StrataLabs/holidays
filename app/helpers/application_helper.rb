module ApplicationHelper
  def authorize_path(provider)
    "#{root_path}auth/#{provider}"
  end
end
