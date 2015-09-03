Given /^there is a user with email address "([^"]+)" and password "([^"]+)"$/ do |email_address, password|
  User.create!(email: email_address, password: password, password_confirmation: password)
end

Given /^I am not signed in$/ do
  sign_out_elem = first("Sign out")
  sign_out_elem.click if sign_out_elem
end

Given /^I am signed in as "(.+)\/(.+)"$/ do |email_address, password|
  visit new_user_session_path
  fill_in "Email", with: email_address
  fill_in "Password", with: password
  click_button "Log in"
end
