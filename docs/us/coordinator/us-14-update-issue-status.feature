@US-14 @R1 @Coordinator
Feature: US-14 Update an issue's status
  As a Coordinator,
  I want to update the status of an issue,
  So that the Reporter can follow its progress.

  # Statuses in the user stories: Under Review, In Progress,
  # Waiting for Confirmation, Closed.
  # The class diagram uses different names. Align them with the team.

  Background:
    Given the Coordinator is signed in

  Scenario: Move an issue to In Progress
    Given an issue with the status "Under Review"
    When the Coordinator changes its status to "In Progress"
    Then the system shall save the new status
    And record the change in the status history
    And send an SMS notification to the Reporter

  Scenario: Mark an issue as waiting for confirmation
    Given an issue with the status "In Progress"
    When the Coordinator changes its status to "Waiting for Confirmation"
    Then the system shall save the new status
    And record the change in the status history
    And send an SMS notification to the Reporter

  Scenario: SMS delivery fails
    Given an issue with the status "Under Review"
    And the SMS service is unavailable
    When the Coordinator changes its status to "In Progress"
    Then the system shall still save the new status
    And record the change in the status history
    And warn the Coordinator that the SMS was not sent
