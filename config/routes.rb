Yaws::Application.routes.draw do  
  
  match 'login' => 'backend/user_sessions#new', :as => :login
  match 'logout' => 'backend/user_sessions#destroy', :as => :logout
    
  namespace :backend do
    root :to => 'dashboard#index'

    resources :users
    resources :user_sessions    
  end

  root :to => 'users#index'
end
