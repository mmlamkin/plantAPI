Rails.application.routes.draw do
  resources :plants, only: [:index, :show]

  resources :gardens

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end