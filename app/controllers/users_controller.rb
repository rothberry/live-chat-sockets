class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.find_or_create_by!(user_params)
    ActionCable.server.broadcast("user_channel", user)
    render json: user
  end

  private

  def user_params
    params.permit(:name, :status)
  end
end
