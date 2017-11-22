Given(/^there is a register page$/) do
  visit '/signup'
end

Then(/^I would like to see a form for registration$/) do
  expect(page).to have_selector 'form'
end

Then(/^I would like to see a text field for user name$/) do
  expect(page).to have_field 'username'
end

Then(/^I would like to see a text field for password$/) do
  expect(page).to have_field 'password'
end

Then(/^I would like to see a register button$/) do
  expect(page).to have_selector 'button'
end

Given(/^username and password has been entered$/) do
  visit '/signup'
  fill_in 'username', :with => 'alfred'
  fill_in 'password', :with => 'whatever'
end

When(/^I press the register button$/) do
  click_button 'Register'
end

Then(/^I would like my information to be saved$/) do
  new_user = User.create(name: 'alfred', password: 'whatever')
  expect(new_user.name).to eq 'alfred'
end
