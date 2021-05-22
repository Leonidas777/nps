class Api::V1::FeedbacksController < Api::V1::BaseController
  def create
    FeedbackService.store_feedback!(feedback_params)
    render json: {}, status: :created
  end

  def index
    feedbacks = FeedbackService.get_feedbacks(
      touchpoint: touchpoint, respondent_class: respondent_class,
      object_class: object_class
    )

    render json: { feedbacks: feedbacks }, status: :ok
  end

  private

  def feedback_params
    params.permit(:score, :touchpoint, :respondent_class, :respondent_id, :object_class, :object_id)
  end

  def touchpoint
    params[:touchpoint]
  end

  def respondent_class
    params[:respondent_class]
  end

  def object_class
    params[:object_class]
  end
end
