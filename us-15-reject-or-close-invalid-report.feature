@US-15 @R1 @Coordinator
Feature: US-15 Reject or close an invalid report with a reason
  As a Coordinator,
  I want to reject or close an invalid report and give a reason,
  So that the Reporter understands why no action was taken.

  # TODO: confirm whether "Rejected" is a separate status or the report becomes "Closed".

  Background:
    Given the Coordinator is signed in
    And a report exists that the Coordinator has found to be invalid

  Scenario: Reject an invalid report with a reason
    When the Coordinator rejects the report
    And enters a reason
    Then the system shall close the report as invalid
    And save the reason
    And record the change in the status history
    And send an SMS notification to the Reporter

  # Assumption: a reason is required. Confirm with the team.
  Scenario: Reject a report without a reason
    When the Coordinator rejects the report without entering a reason
    Then the system shall not change the report
    And ask the Coordinator to enter a reason
