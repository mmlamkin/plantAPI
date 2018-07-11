class GardensController < ApplicationController

  def show
    @garden = Garden.find_by(id: params[:id])
    render json: {plants: @garden.plants}, status: :ok
  end

  def create

    garden = Garden.new

    if garden.save
      render status: :ok

    else
      render json: {ok: false, errors: garden.errors}, status: :bad_request

    end
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @plant = Plant.find_by(id: params[:plant_id])

    if @user && @plant
      @garden = @user.gardens[0]
      @garden.plants << @plant
      render json: {id: @user.id, garden: @user.gardens[0], plant: @plant}, status: :ok
    end
  end
end
