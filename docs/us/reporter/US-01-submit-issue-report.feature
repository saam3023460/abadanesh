Feature: Submit an Issue Report
  As a reporter (student or university staff member)
  I want to submit a report describing an issue in the university environment
  So that the responsible personnel can become aware of the issue and take appropriate action

  Background:
    Given I am an authenticated reporter
    And I am on the report submission page

  Scenario: Successfully submit a report
    When I provide the required report information
    And I submit the report
    Then the system shall create a new report
    And associate it with my account
    And assign it an initial issue status
    And confirm that the report was successfully submitted

  Scenario: Submit a report with missing required information
    When I attempt to submit a report without providing required information
    Then the system shall reject the submission
    And indicate which required information is missing
    And preserve the information I have already entered

  Scenario: Submit a report with invalid information
    When I provide invalid or unsupported information for a report field
    And I attempt to submit the report
    Then the system shall reject the submission
    And indicate the invalid field
    And allow me to correct the information

  Scenario: Prevent unauthorized report submission
    Given I am not authenticated as an eligible reporter
    When I attempt to submit a report
    Then the system shall prevent the submission
    And inform me that authentication is required

