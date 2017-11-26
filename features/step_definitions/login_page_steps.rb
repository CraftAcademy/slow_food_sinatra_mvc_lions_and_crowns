Given(/^the following users exist$/) do |table|
  table.hashes.each do |user|
    User.create!(user)
  end
end

Given(/^I visit the login page$/) do
  visit '/login'
end
