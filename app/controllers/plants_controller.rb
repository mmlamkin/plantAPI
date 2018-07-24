
class PlantsController < ApplicationController

  def index
    data = Plant.all

    render status: :ok, json: data
  end

  def show
    data = Plant.find_by(id: params[:id])

    if data.nil?
      render json: { ok: false, :errors => "Plant not found" }, status: :not_found
    else
      render status: :ok, json: data
    end
  end

  def create
    @new_plant = Plant.new()
    @new_plant.name = params[:name]
    @new_plant.description = params[:description]
    @new_plant.optimal_sun = params[:optimal_sun]
    @new_plant.planting_considerations = params[:planting_considerations]
    @new_plant.growing_from_seed = params[:growing_from_seed]
    @new_plant.when_to_plant = params[:when_to_plant]
    @new_plant.spacing = params[:spacing]
    @new_plant.watering = params[:watering]
    @new_plant.other_care = params[:other_care]
    @new_plant.watering = params[:watering]
    @new_plant.pests = params[:pests]
    @new_plant.harvesting = params[:harvesting]
    @new_plant.image = params[:image]

    if Plant.find_by(name: params[:name])
      render(
        status: :bad_request, json: { errors: "already in plant library" }
      )
    else
      if @new_plant.save
        render(
          status: :ok,
          json: @new_plant.as_json
        )
      else
        render status: :bad_request, json: { errors: errors.messages }
      end
    end
  end
end
