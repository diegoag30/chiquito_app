Rails.application.routes.draw do
  resources :visits
  resources :links

  # Destroy user
  delete "users/:id", to: "users#destroy", as: :destroy_user

  # PATH NAMES TO AVOID /users IN URL
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  # HOME 
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  root to: redirect('/login')
end