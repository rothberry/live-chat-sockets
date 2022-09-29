class MessagesController < ApplicationController
  def index
    render json: Message.all
  end

  def create
    message = Message.create!(message_params)
    ActionCable.server.broadcast("message_channel", message)
    head :ok
    # render json: message
  end

  private

  def message_params
    params.permit(:user_id, :content)
  end
end
