Given(/^there is a register page$/) do
  visit '/signup'
end

When(/^I visit the register page$/) do
  visit '/signup'
end

Then(/^I would like to see a form for registration$/) do
  expect(page).to have_selector 'form'
end

Then(/^I would like to see a text field for user name$/) do
  expect(page).to have_field 'Username'
end

Then(/^I would like to see a text field for password$/) do
  expect(page).to have_field 'Password'
end

Then(/^I would like to see a register button$/) do
  expect(page).to have_selector(:link_or_button, "Sign up")
end

Given(/^username and password has been entered$/) do
  visit '/signup'
  fill_in 'username', :with => 'alfred'
  fill_in 'password', :with => 'whatever'
end

When(/^I press the register button$/) do
  click_button 'Sign up'
end

Then(/^I would like my information to be saved$/) do
  user = User.last
  expect(user.name).to eq 'alfred'
end
