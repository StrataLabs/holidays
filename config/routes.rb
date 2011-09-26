Holidays::Application.routes.draw do
  devise_for :users

  root :to => "welcome#index"
  resources :inquiries, :only => [:create, :show] do
    put 'questions/:question_id/response', :controller => :responses, :action => :create_or_update, :as => :question_preferences
    resource 'detail', :only => [:create]
  end
end
