Feature: View Submitted Reports
  As a reporter
  I want to view the reports I have previously submitted
  So that I can keep track of the issues and suggestions I have reported

  Background:
    Given I am an authenticated reporter

  Scenario: View my submitted reports
    Given I have previously submitted one or more reports
    When I open my submitted reports page
    Then the system shall display the reports associated with my account
    And provide relevant information about each report

  Scenario: View an individual report
    Given I have previously submitted a report
    When I open my submitted reports page
    And select that report
    Then the system shall display its details
    And show its description, category, location, attached images, and current status where applicable

  Scenario: View submitted reports when none exist
    Given I have not submitted any reports
    When I open my submitted reports page
    Then the system shall display an appropriate message indicating that I have no submitted reports

  Scenario: Prevent access to another user's private reports
    Given another reporter has submitted a report
    When I attempt to access that report without authorization
    Then the system shall deny access to the report

