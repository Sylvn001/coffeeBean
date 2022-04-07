Rails.application.routes.draw do
  get 'home', to: "home#index"
  get 'register', to: 'users#register'
  post 'auth', to: 'session#auth'
  get 'logout', to: 'session#logout'


  resources :users
  root "users#index"
end
