Given(/^the following users exist$/) do |table|
  table.hashes.each do |user|
    User.create!(user)
  end
end

Given(/^I visit the login page$/) do
  visit '/login'
end

Then(/^I should be logged out$/) do
  expect(page).to_not have_content 'Logged In'
end

When(/^I press the "([^"]*)" link$/) do |link|
  click_link link
end
