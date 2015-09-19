Given(/^user "(.*?)" has a survey named "(.*?)"$/) do |user_email, survey_name|
  user = User.find_by(email: user_email)
  user.surveys.create!(name: survey_name)
end

