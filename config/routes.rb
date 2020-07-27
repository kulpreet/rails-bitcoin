Rails.application.routes.draw do
  get 'home/index'

  resources :addresses

  root 'addresses#index'
end
