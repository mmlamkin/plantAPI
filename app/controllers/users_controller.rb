class UsersController < ApplicationController
  def index
    @users = User.all
    render json: {users: @users}, status: :ok
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user

      render json: {id: @user.id, garden_id: @user.gardens[0].id}, status: :ok

    else
      @user = User.create(email: params[:user][:email])
      garden = Garden.create(user_id: @user.id)
      render json: {user_id: @user.id, garden_id: garden.id}, status: :ok
    end
  end

  def update

  end

  def destroy

  end
end
