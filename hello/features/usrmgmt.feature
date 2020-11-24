Feature: User Management
  To test User registration and login

  Scenario: Create a new account
    In order to create a new account
      Given I am not authenticated
      When I goto the Signup page
      And I fill in "Name" with "someone"
      And I fill in "Username" with "someone"
      And I fill in "Email" with "someone@web3.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I press "Sign up"
      Then I should see "Welcome! You have signed up successfully."
      And I should not see "Sign In"

  Scenario: Authentication
    In order for a user to login
      Given I am not signed in
      When I visit the sign in page
      And I fill in the form and press "Log in" button
      Then I should see "Signed in successfully."
      And I should not see "Sign In" and "Sign Up"