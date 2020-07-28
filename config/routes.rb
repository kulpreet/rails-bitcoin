Rails.application.routes.draw do
  get 'home/index'

  resources :addresses

  root 'addresses#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
