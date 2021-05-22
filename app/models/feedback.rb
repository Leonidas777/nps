class Feedback < ActiveRecord::Base
  SCORE_ALLOWED              = (0..10).to_a.freeze
  TOUCHPOINTS_ALLOWED        = %w[realtor_feedback].freeze
  OBJECT_CLASSES_ALLOWED     = %w[realtor].freeze
  RESPONDENT_CLASSES_ALLOWED = %w[seller].freeze

  validates :score, inclusion: SCORE_ALLOWED
  validates :touchpoint, inclusion: TOUCHPOINTS_ALLOWED
  validates :object_class, inclusion: OBJECT_CLASSES_ALLOWED
  validates :respondent_class, inclusion: RESPONDENT_CLASSES_ALLOWED
end
