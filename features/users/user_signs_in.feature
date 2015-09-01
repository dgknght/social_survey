Feature: A user signs in to the application
  As a user
  In order to use the application
  I need to be able to sign in

  Scenario: A user signs in successfully
    Given there is a user with email address "john@doe.com" and password "please01"
    And I am not signed in

    When I am on the welcome page
    Then I should see "Sign in" within the menu

    When I click "Sign in" within the menu
    Then I should see "Sign in" within the page title

    When I fill in "Email" with "john@doe.com"
    And I fill in "Password" with "please01"
    And I click "Log in"
    Then I should see "Signed in successfully." within the notifications area
    And I should see "Sign out" within the menu
