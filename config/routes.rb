Spree::Core::Engine.routes.draw do
  namespace :admin do
    get '/authorization_failure', :to => 'user_sessions#authorization_failure', :as => :unauthorized
    get '/login' => 'user_sessions#new', :as => :login
    post '/login' => 'user_sessions#create', :as => :create_new_session
    delete '/logout' => 'user_sessions#destroy', :as => :logout

    get '/password/recover' => 'user_passwords#new', :as => :recover_password
    post '/password/recover' => 'user_passwords#create', :as => :reset_password
    get '/password/change' => 'user_passwords#edit', :as => :edit_password
    put '/password/change' => 'user_passwords#update', :as => :update_password
  end
end
