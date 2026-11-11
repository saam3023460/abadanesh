@US-16 @R1 @Coordinator
Feature: US-16 View an issue's status history
  As a Coordinator,
  I want to view the status history of an issue,
  So that I can see how it progressed over time.

  # Align the listed fields with the StatusLog in the class diagram.

  Background:
    Given the Coordinator is signed in

  Scenario: View the history of an issue with several changes
    Given an issue whose status has changed more than once
    When the Coordinator opens the status history of the issue
    Then the system shall list every status change in chronological order
    And show the previous status, the new status, and the date and time of each change

  Scenario: View the history of an issue with no changes
    Given an issue whose status has never been changed
    When the Coordinator opens the status history of the issue
    Then the system shall show only the initial status
