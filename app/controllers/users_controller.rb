class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.create!(user_params)
    ActionCable.server.broadcast("user_channel", user)
    rendr json: user
  end

  private

  def user_params
    params.permit(:name, :status)
  end
end
