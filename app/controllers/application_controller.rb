class ApplicationController < ActionController::API
  rescue_from Exception, with: :server_error_response
  rescue_from KeyError, with: :not_all_params_provided_response
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response

  private

  def not_all_params_provided_response
    render json: { errors: [{ message: 'Not all parameters have been provided' }] },
           status: :unprocessable_entity
  end

  def invalid_record_response(e)
    render json: { errors: [{ message: e.message }] },
           status: :unprocessable_entity
  end

  def server_error_response
    render json: { errors: [{ message: 'Something went wrong' }] },
           status: :internal_server_error
  end
end
