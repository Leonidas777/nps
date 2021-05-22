FactoryBot.define do
  factory :feedback do
    score { 0 }
    touchpoint { Feedback::TOUCHPOINTS_ALLOWED.first }

    object_class { Feedback::OBJECT_CLASSES_ALLOWED.first }
    sequence(:object_id)  { |i| i }

    respondent_class { Feedback::RESPONDENT_CLASSES_ALLOWED.first }
    sequence(:respondent_id)  { |i| i }
  end
end
