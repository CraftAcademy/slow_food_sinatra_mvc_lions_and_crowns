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

Then(/^I would like to see a text field for password confirmation$/) do
  expect(page).to have_field 'confirm_password'
end

Then(/^I would like to see a register button$/) do
  expect(page).to have_selector(:link_or_button, "Sign up")
end

Given(/^username and password has been entered$/) do
  visit '/signup'
  fill_in 'username', :with => 'alfred'
  fill_in 'password', :with => 'whatever'
  fill_in 'confirm_password', :with => 'whatever'
end

When(/^I press the register button$/) do
  click_button 'Sign up'
end

Then(/^I would like my information to be saved$/) do
  user = User.last
  expect(user.name).to eq 'alfred'
end

Then(/^I would like a message saying my user has been created$/) do
  expect(page).to have_content 'Your user has been created'
end

Given(/^only the username has been entered$/) do
  visit '/signup'
  fill_in 'username', :with => 'alfred'
end

When(/^I press the sign up button$/) do
  click_button 'Sign up'
end

Then(/^I get en error message saying you need to enter a password$/) do
  expect(page).to have_content "Password can't be blank"
end

Given(/^the password confirmation differs from password$/) do
  visit '/signup'
  fill_in 'username', :with => 'alfred'
  fill_in 'password', :with => 'whatever'
  fill_in 'confirm_password', :with => 'poop'
end

Then(/^I get an error message saying password confirmation differs from password$/) do
  expect(page).to have_content "Password confirmation doesn't match Password"
end
