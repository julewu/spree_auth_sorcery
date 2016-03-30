Spree::Core::Engine.routes.draw do
  namespace :admin do
    get '/authorization_failure', :to => 'user_sessions#authorization_failure', :as => :unauthorized
    get '/login' => 'user_sessions#new', :as => :login
    post '/login' => 'user_sessions#create', :as => :create_new_session
    post '/logout' => 'user_sessions#destroy', :as => :logout
  end
end
