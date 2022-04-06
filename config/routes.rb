Rails.application.routes.draw do
  resources :users
  get 'register', to: 'users#register'
  post 'auth', to: 'users#auth'

  get 'home', to: "home#index"

  root "users#index"
end
