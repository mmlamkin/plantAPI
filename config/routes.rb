Rails.application.routes.draw do

  root "plants#index"

  resources :plants, only: [:index, :show, :create]

  patch "/users/:user_id/plants/:plant_id", to: "gardens#add_to_garden", as: "add_to_garden"

  delete "/users/:user_id/plants/:plant_id", to: "gardens#del_from_garden", as: "del_from_garden"

  delete '/users/:user_id/gardens/:garden_id', to: "gardens#clear_garden"

  # resources :users, only: [:index, :show, :create]

  resources :users do
    resources :gardens, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
