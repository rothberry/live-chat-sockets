class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_invalid(err)
    render json: { err: err.record.errors.full_messages }, status: 422
  end

  def render_not_found(err)
    render json: { err: "NAH" }, status: 404
  end
end
