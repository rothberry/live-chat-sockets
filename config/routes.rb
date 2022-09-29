Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  resources :messages, only: [:index, :create]
  resources :users, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
