Rails.application.routes.draw do
  resources :links
  #PATH NAMES PARA EVITAR USER /users 
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  #Devuelve al login si no se ha inicado sesion
  authenticated :user do
   root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/login')
end
