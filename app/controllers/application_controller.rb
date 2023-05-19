class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { errors: exception.message }, status: :not_found
  end

  def render_failed_validation_response(model)
    errors = model.errors.full_messages.join(", ")
    error_message = "Validation failed: #{errors}"
    render json: ErrorSerializer.serialize(error_message), status: 400
    require 'pry'; binding.pry
  end
end
