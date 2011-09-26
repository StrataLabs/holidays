Holidays::Application.routes.draw do
  root :to => "welcome#index"
  resources :inquiries, :only => [:create, :show] do
    put 'questions/:question_id/response', :controller => :responses, :action => :create_or_update, :as => :question_preferences
    resource 'detail', :only => [:create]
  end

  [:facebook].each do |provider|
    match "/auth/#{provider}/callback" => "sessions##{provider}"
  end
  #match "/signout" => "sessions#destroy", :as => :signout
end
