Rails.application.routes.draw do
  resources :plants, only: [:index, :show]

  post "/add_plant", to: "plants#add_plant", as: "add_plant"

  patch "/users/:user_id/plants/:plant_id", to: "gardens#add_to_garden", as: "add_to_garden"

  resources :gardens

  resources :users do
    resources :gardens, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
