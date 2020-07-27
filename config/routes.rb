Rails.application.routes.draw do
  get 'home/index'

  resources :addresses

  root 'home#index'
end
