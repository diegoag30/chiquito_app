Rails.application.routes.draw do
 #PATH NAMES PARA EVITAR USER /users 
 devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
 #HOME 
 root "home#index"
end
