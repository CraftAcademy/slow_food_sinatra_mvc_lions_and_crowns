Given(/^I visit the register page$/) do
  visit '/signup'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in field_name, with: value
end

When(/^I press the "([^"]*)" button$/) do |button|
  click_button button
end

Then(/^I would like my user "([^"]*)" to be saved in the database$/) do |username|
  user = User.last
  expect(user.name).to eq username
end

Then(/^I get a message saying "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Then(/^I would like to be redirected to the home page$/) do
  expect(page).to have_current_path '/'
end
