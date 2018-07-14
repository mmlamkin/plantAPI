Rails.application.routes.draw do
  get 'sessions/create'

  root 'plants#index'
  resources :plants, only: [:index, :show]

  post "/add_plant", to: "plants#add_plant", as: "add_plant"

  patch "/users/:user_id/plants/:plant_id", to: "gardens#add_to_garden", as: "add_to_garden"

  delete "/users/:user_id/plants/:plant_id", to: "gardens#del_from_garden", as: "del_from_garden"

  delete '/users/:user_id/gardens/:garden_id', to: "gardens#clear_garden"

  get "/auth/:provider/callback", to: "sessions#create"

  resources :gardens

  resources :users do
    resources :gardens, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
