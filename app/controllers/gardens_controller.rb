class GardensController < ApplicationController

  def show
    @garden = Garden.find_by(id: params[:id])
    render json: {plants: @garden.plants}, status: :ok
  end

  def new

  end

  def create


    if garden.save
      render json: {customer_id: rental.customer_id, movie_id: rental.movie_id}, status: :ok

    else
      render json: {ok: false, errors: rental.errors}, status: :bad_request

    end

  else

    render json: {ok: false, errors: "No copies available"}, status: :bad_request
  end
end
