class GardensController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    garden = Garden.create(
      customer_id: params[:customer_id],
      movie_id: params[:movie_id],

    )

    if garden.save
      render json: {customer_id: rental.customer_id, movie_id: rental.movie_id}, status: :ok

    else
      render json: {ok: false, errors: rental.errors}, status: :bad_request

    end

  else

    render json: {ok: false, errors: "No copies available"}, status: :bad_request
  end
end
