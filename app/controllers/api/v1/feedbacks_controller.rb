class Api::V1::FeedbacksController < Api::V1::BaseController
  def create
    FeedbackService.store!(feedback_params)
    render json: {}, status: :created
  end

  def show
    render json: {}, status: :ok
  end

  def feedback_params
    params.permit(:score, :touchpoint, :respondent_class, :respondent_id, :object_class, :object_id)
  end
end
