Feature: Registration page
  As a customer
  In order to login
  I need to be able to register

  Scenario: Visitor writes his information and presses register
    Given I visit the register page
    When I fill in "Username" with "Alfred"
    And I fill in "Password" with "whatever"
    And I fill in "Password Confirmation" with "whatever"
    When I press the sign up button
    Then I would like my user "Alfred" to be saved in the database
    And I get a message saying "Your user has been created"
    And I would like to be redirected to the home page

  Scenario: Visitor gets error message when not filling in password
    Given I visit the register page
    When I fill in "username" with "Alfred"
    And I press the sign up button
    Then I get a message saying "Password can't be blank"

  Scenario: Visitor gets error message when password confirmation is different as password
    Given I visit the register page
    When I fill in "password" with "whatever"
    And I fill in "confirm_password" with "poop"
    And I press the sign up button
    Then I get a message saying "Password confirmation doesn't match Password"
