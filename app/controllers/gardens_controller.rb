
class GardensController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @garden = @user.gardens.first
    render json: {garden_id: @garden.id, plants: @garden.plants}, status: :ok
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @garden = @user.gardens.first
    render json: {garden: @garden, plants: @garden.plants}, status: :ok
  end

  def create

    garden = Garden.new

    if garden.save
      render status: :ok

    else
      render json: {ok: false, errors: garden.errors}, status: :bad_request

    end
  end

  def add_to_garden
    @user = User.find_by(id: params[:user_id])
    @plant = Plant.find_by(id: params[:plant_id])

    if @user && @plant

      if !@user.gardens.first.plants.include?(@plant)
        @garden = @user.gardens[0]
        @garden.plants << @plant
        render json: {id: @user.id, garden: @user.gardens[0], plant: @plant}, status: :ok
      else
        render json: {ok: false, errors: 'This plant is already in your garden'}, status: :bad_request
      end

    else
      render json: {ok: false, errors: gardens.error}, status: :bad_request
    end

  end


  def del_from_garden
    @user = User.find_by(id: params[:user_id])
    @plant = Plant.find_by(id: params[:plant_id])

    if @user && @plant
      if @user.gardens.first.plants.include?(@plant)
        @garden = @user.gardens[0]
        @garden.plants.delete(@plant.id)

        render json: {id: @user.id, garden: @user.gardens[0]}, status: :ok

      else
        render json: {ok: false, errors: 'Could not delete plant'}, status: :bad_request
      end

    else
      render json: {ok: false, errors: gardens.error}, status: :bad_request
    end
  end

  def clear_garden
    @user = User.find_by(id: params[:user_id])
    @garden = @user.gardens[0]

    if @user && @garden
      @garden.plants.clear

      render json: {id: @user.id, garden: @user.gardens[0]}, status: :ok
    else
      render json: {ok: false, errors: 'Could not clear garden'}, status: :bad_request
    end

  end
end
