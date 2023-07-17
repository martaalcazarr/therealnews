Rails.application.routes.draw do
  resources :comments
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords', 
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
    }, path_names: {
    sign_up: 'register'
  }


  # resources :posts, except: [:index]
  root "home#index"
  # get '/posts', to: 'posts#index', as: 'user_root'
  resources :posts
end
