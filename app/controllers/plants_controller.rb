require_relative '../..//lib/plant_wrapper'

class PlantsController < ApplicationController
  def index
    data = PlantWrapper.show_all
    render status: :ok, json: data
  end

  def show
    data = PlantWrapper.search(params[:id])

    if data.nil?
      render json: { ok: false, :errors => "Plant not found" }, status: :not_found
    else
      render status: :ok, json: data
    end
  end
end
