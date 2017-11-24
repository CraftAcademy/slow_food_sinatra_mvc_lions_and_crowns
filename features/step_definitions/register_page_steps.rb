Given(/^I visit the register page$/) do
  visit '/signup'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in field_name, with: value
end

When(/^I press the sign up button$/) do
  click_button 'Sign up'
end

Then(/^I would like my information to be saved$/) do
  user = User.last
  expect(user.name).to eq 'Alfred'
end

Then(/^I get a message saying "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Then(/^I would like to be redirected to the home page$/) do
  expect(page).to have_current_path '/'
end
