Given(/^there are "([^"]*)" users in the database$/) do |count|
  count.to_i.times do
    User.create(name: Faker::Name.name, password: 'whatever_works')
  end
end

Given(/^I visit the users page$/) do
  visit '/users'
end

Then(/^I should see "([^"]*)" users$/) do |count|
  expect(page).to have_css 'div .user', count: count.to_i
end
