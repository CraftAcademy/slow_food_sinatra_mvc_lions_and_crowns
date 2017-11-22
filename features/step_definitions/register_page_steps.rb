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
