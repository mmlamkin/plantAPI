class UsersController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])

    if !@user.nil?

      render json: {id: @user.id, garden_id: @user.gardens[0].id} status: :ok

    else
      @user = User.create(email: params[:user][:email])
      garden = Garden.create(user_id: @user.id)
      render json: {id: @user.id, garden_id: @user.gardens[0].id} status: :ok

    end
  end

  def new
      @new_user = User.new
  end

  def destroy
    flash[:success] = "Logged Out"
    redirect_to root_path
  end
end
