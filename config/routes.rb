Rails.application.routes.draw do
  resources :plants, only: [:index, :show]

  post "/add_plant", to: "plants#add_plant", as: "add_plant"

  patch "/users/:user_id/plants/:plant_id", to: "gardens#update", as: "update_garden"

  resources :gardens

  resources :users do
    resources :gardens, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
