Feature: Registration page
  As a customer
  In order to login
  I need to be able to register

  Scenario: Visitor sees a form to register on register page
    Given there is a register page
    Then I would like to see a form for registration
    And I would like to see a text field for user name
    And I would like to see a text field for password
