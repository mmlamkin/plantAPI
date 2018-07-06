class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
  end
end
