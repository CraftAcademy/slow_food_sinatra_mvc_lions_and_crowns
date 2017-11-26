Feature: Login Page
  As a customer
  In order to gain full access to the page
  I would like to be able to login

  Background:
  Given the following users exist
    | name   | password |
    | Alfred | whatever |

  Scenario: Visitor writes his information and presses login
    Given I visit the login page
    When I fill in "Username" with "Alfred"
    And I fill in "Password" with "whatever"
    And I press the "Login" button
    Then I would like to be redirected to the home page
    And I get a message saying "Welcome Alfred! You are logged in"
