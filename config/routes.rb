Holidays::Application.routes.draw do
  root :to => "welcome#index"
  resources :inquiries, :only => [:create, :show] do
    put 'questions/:question_id/response', :controller => :responses, :action => :create_or_update, :as => :question_preferences
    resource 'detail', :only => [:create]

    # not RESTful. This is a GET because it is a callback from omniauth
    get 'user/set', :controller => :inquiries, :action => "set_user", :as => :set_user
  end

  [:facebook].each do |provider|
    match "/auth/#{provider}/callback" => "sessions##{provider}"
  end
  #match "/signout" => "sessions#destroy", :as => :signout
end
