Feature: Edit A Survey
  As a user
  In order to update a survey,
  I need to be able to edit it
  
  Scenario: A user edits a survey
    Given there is a user with email address "bob.bobby@bob.bob" and password "12345678"
    And user "bob.bobby@bob.bob" has a survey named "My Other Test Survey"
    And I am signed in as "bob.bobby@bob.bob/12345678"
    And I am on the welcome page
    Then I should see "Surveys" within the menu
    
    When I click "Surveys" within the menu
    Then I should see "Surveys" within the page title
    And I should see the following survey table
      | Name                 |
      | My Other Test Survey |
    
    When I click "Edit"
    Then I should see "Edit survey" within the page title
    
    When I fill in "Name" with "My Other Other Survey"
    And I fill in "Description" with "This is my other other surveu :D"
    And I click "Save"
    Then I should see "The survey was updated successfully." within the notifications area
    And I should see the following survey table
    | Name                  |
    | My Other Other Survey |
