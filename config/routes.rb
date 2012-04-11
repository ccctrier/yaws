Yaws::Application.routes.draw do  
  
  namespace :backend do resources :planets end

  match 'login' => 'backend/user_sessions#new', :as => :login
  match 'logout' => 'backend/user_sessions#destroy', :as => :logout
  match 'rss' => 'posts#feed', :defaults => { :format => 'rss' }, :as => :rss
  match 'atom' => 'posts#feed', :defaults => { :format => 'atom'}, :as => :atom
    resources :posts
  namespace :backend do
    root :to => 'dashboard#index'

    resources :users, :posts
    resources :user_sessions    
  end

  root :to => 'backend/user_sessions#new'
end
