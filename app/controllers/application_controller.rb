class ApplicationController < ActionController::API
  include CustomErrors

  rescue_from Exception, with: :server_error_response
  rescue_from CustomErrors::NotAllParamsProvided, with: :not_all_params_provided_response
  rescue_from CustomErrors::InvalidScoreProvided, with: :invalid_score_provided_response

  private

  def not_all_params_provided_response
    render json: { errors: [{ message: 'Not all parameters have been provided' }] },
           status: :unprocessable_entity
  end

  def invalid_score_provided_response
    render json: { errors: [{ message: 'Invalid score have been provided' }] },
           status: :unprocessable_entity
  end

  def server_error_response
    render json: { errors: [{ message: 'Something went wrong' }] },
           status: :internal_server_error
  end
end
