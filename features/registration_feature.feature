Feature: Registration page
  As a customer
  In order to login
  I need to be able to register

  Scenario: Visitor sees a form to register on register page
    #Given there is a register page
    When I visit the register page
    Then I would like to see a form for registration
    And I would like to see a text field for user name
    And I would like to see a text field for password
    And I would like to see a register button

  Scenario: Visitor writes his information and presses register
    Given username and password has been entered
    When I press the register button
    Then I would like my information to be saved
    And I would like a message saying my user has been created
