json.feedbacks @feedbacks do |feedback|
  json.score            feedback.score
  json.touchpoint       feedback.touchpoint
  json.respondent_class feedback.respondent_class
  json.respondent_id    feedback.respondent_id
  json.object_class     feedback.object_class
  json.object_id        feedback.object_id
end
