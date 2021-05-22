class FeedbackService
  class << self
    def store_feedback!(params={})
      score            = params.fetch(:score).to_i
      touchpoint       = params.fetch(:touchpoint)
      respondent_class = params.fetch(:respondent_class)
      respondent_id    = params.fetch(:respondent_id)
      object_class     = params.fetch(:object_class)
      object_id        = params.fetch(:object_id)

      feedback =
        Feedback.find_or_initialize_by(
          touchpoint: touchpoint,
          respondent_class: respondent_class,
          respondent_id: respondent_id,
          object_class: object_class,
          object_id: object_id
        )

      feedback.score = score
      feedback.save!
    end

    def get_feedbacks(touchpoint:, respondent_class: nil, object_class: nil)
      feedbacks = Feedback.where(touchpoint: touchpoint)

      unless respondent_class.nil?
        feedbacks = feedbacks.where(respondent_class: respondent_class)
      end

      unless object_class.nil?
        feedbacks = feedbacks.where(object_class: object_class)
      end

      feedbacks
    end
  end
end
