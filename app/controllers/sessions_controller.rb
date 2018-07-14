class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    @user = User.find_by(email: auth_hash.info.email)

    if @user
      render json: {hash: auth_hash, user: @user}, status: :ok
    else
      User.create(email: auth_hash.info.email)
      render json: {hash: auth_hash, user: @user}, status: :ok
    end
  end
end
