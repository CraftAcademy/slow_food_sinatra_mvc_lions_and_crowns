Feature: Registration page
  As a customer
  In order to login
  I need to be able to register

  Scenario: Visitor sees a form to register on register page
    When I visit the register page
    Then I would like to see a form for registration
    And I would like to see a text field for user name
    And I would like to see a text field for password
    And I would like to see a text field for password confirmation
    And I would like to see a sign up button

  Scenario: Visitor writes his information and presses register
    Given I visit the register page
    When I fill in 'name' with 'alfred'
    And I fill in 'password' with 'whatever'
    And I fill in 'password confirmation' with 'whatever'
    When I press the sign up button
    Then I would like my information to be saved
    And I would like a message saying my user has been created

  Scenario: Visitor gets error message when not filling in password
    Given I visit the register page
    When I fill in 'name' with 'alfred'
    And I press the sign up button
    Then I get en error message saying you need to enter a password

  Scenario: Visitor gets error message when password confirmation is different as password
    Given I visit the register page
    When I fill in 'password' with 'whatever'
    And I fill in 'password confirmation' with 'poop'
    And I press the sign up button
    Then I get an error message saying password confirmation differs from password
