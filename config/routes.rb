Holidays::Application.routes.draw do
  root :to => "welcome#index"
  resources :inquiries, :only => [:create]
end
