Yaws::Application.routes.draw do  
  
  namespace :backend do resources :planets end

  match 'backend/login' => 'backend/user_sessions#new', :as => :login
  match 'backend/logout' => 'backend/user_sessions#destroy', :as => :logout
  match 'dashboard' => 'backend/dashboard#index', :as => :dashboard
    
  match 'rss' => 'posts#feed', :defaults => { :format => 'rss' }, :as => :rss
  match 'atom' => 'posts#feed', :defaults => { :format => 'atom'}, :as => :atom
    resources :posts
  namespace :backend do
    root :to => 'dashboard#index'

    resources :users, :posts
    resources :user_sessions    
  end

  root :to => 'posts#index'
end
