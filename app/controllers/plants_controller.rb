class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find_by(id: params[:id])

    if @movie.nil?
      render json: { ok: false, :errors => "Plant not found" }, status: :not_found
    end

  end
end
