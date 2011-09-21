Holidays::Application.routes.draw do
  root :to => "welcome#index"
  resources :inquiries, :only => [:create, :show] do
    put 'questions/:question_id/response', :controller => :responses, :action => :create_or_update, :as => :question_preferences
    match 'details', :controller => :details, :action => :create_or_update, :as => :details, :only => [:put, :post]
  end
end
