class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def render_invalid(err)
    render json: { err: err.record.errors.full_messages }, status: 422
  end
end
