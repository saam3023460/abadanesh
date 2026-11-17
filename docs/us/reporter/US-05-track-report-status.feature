Feature: Track Report Status and Progress
  As a reporter
  I want to view the current status and relevant progress updates of my reports
  So that I can understand how the reported issues are being handled

  Background:
    Given I am an authenticated reporter
    And I have submitted a report

  Scenario: View the current status of a report
    When I view my report
    Then the system shall display its current issue status

  Scenario: View progress updates
    Given progress updates have been recorded for my report
    When I view my report details
    Then the system shall display the relevant progress updates

  Scenario: View a report without progress updates
    Given no progress updates have been recorded for my report
    When I view my report details
    Then the system shall indicate that no progress updates are currently available

  Scenario: Receive notification when report status changes
    When the status of my report changes
    Then the system shall notify me about the status change
    And identify the report associated with the notification

  Scenario: Receive notification about report progress
    Given a relevant progress update is recorded for my report
    When the system processes that update
    Then I shall be notified if the update triggers a notification according to the system's notification rules

