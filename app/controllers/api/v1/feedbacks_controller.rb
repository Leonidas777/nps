class Api::V1::FeedbacksController < Api::V1::BaseController
  def create
    render json: {}, status: :created
  end

  def show
    render json: {}, status: :ok
  end
end
