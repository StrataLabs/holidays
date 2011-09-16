Holidays::Application.routes.draw do
  root :to => "welcome#index"
  resources :inquiries, :only => [:create, :show] do
    put 'questions/:question_id/preferences', :action => :preferences, :as => :question_preferences
  end
end
