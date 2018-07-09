require_relative '../..//lib/plant_wrapper'

class PlantsController < ApplicationController
  def index
    data = PlantWrapper.show_all
    render status: :ok, json: data
  end

  def show
    @plant = Plant.find_by(id: params[:id])

    render(
      status: :ok,
      json: @movie.as_json(
        only: [:title, :overview, :release_date, :inventory],
        methods: [:available_inventory]
      )
    )

    if @plant.nil?
      render json: { ok: false, :errors => "Plant not found" }, status: :not_found
    end

  end
end
