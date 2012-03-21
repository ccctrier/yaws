Yaws::Application.routes.draw do  
  resources :users
  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  namespace :backend do
    root :to => 'dashboard#index'    
  end

  root :to => 'users#index'
end
