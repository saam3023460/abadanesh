@US-11 @R1 @Coordinator
Feature: US-11 Sign in with staff credentials
  As a Coordinator,
  I want to sign in with my staff credentials,
  So that I can access and manage incoming reports.

  Scenario: Sign in with valid credentials
    Given a Coordinator account exists
    When the Coordinator enters valid staff credentials
    And submits the sign-in form
    Then the system shall sign the Coordinator in
    And display the list of incoming reports

  Scenario: Sign in with invalid credentials
    Given a Coordinator account exists
    When the Coordinator enters incorrect credentials
    And submits the sign-in form
    Then the system shall deny access
    And display an error message
    And the Coordinator shall remain signed out

  Scenario: Reporter account cannot use the staff area
    Given a Reporter account exists
    When the Reporter tries to sign in as staff
    Then the system shall deny access to the staff area
