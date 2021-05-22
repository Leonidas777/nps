class Feedback < ActiveRecord::Base
  SCORE_ALLOWED              = (0..10).to_a.freeze
  TOUCHPOINTS_ALLOWED        = %w[realtor_feedback realtor_feedback2].freeze
  OBJECT_CLASSES_ALLOWED     = %w[realtor deal].freeze
  RESPONDENT_CLASSES_ALLOWED = %w[seller buyer].freeze

  validates :score, inclusion: SCORE_ALLOWED
  validates :touchpoint, inclusion: TOUCHPOINTS_ALLOWED
  validates :object_class, inclusion: OBJECT_CLASSES_ALLOWED
  validates :respondent_class, inclusion: RESPONDENT_CLASSES_ALLOWED
end
