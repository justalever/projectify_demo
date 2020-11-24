Feature: Admin Panel
  To test Admin Panel and its features

  Scenario: Admin controls
  In order to perform admin controls
    Given I am an Admin
    And Two new users have registered
    And I am logged in
    When I visit Admin Panel
    Then I should see list of registered users
    And I should see user statistics
    And I can ban a user and see success message
    Then I can activate a user and see success message