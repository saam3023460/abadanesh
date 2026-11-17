@US-13 @R1 @Coordinator
Feature: US-13 Review a report and set its structured location and category
  As a Coordinator,
  I want to review a report and set its structured location and category,
  So that reports are organized consistently.

  Background:
    Given the Coordinator is signed in
    And a report exists with a free-text location

  Scenario: Open a report for review
    When the Coordinator opens the report
    Then the system shall show the description, photos, location, and category submitted by the Reporter

  Scenario: Set a structured location and category
    Given the Coordinator is reviewing the report
    When the Coordinator selects a structured location from the list
    And selects a category
    And saves the changes
    Then the system shall store the structured location and category on the report
    And display a confirmation message

  # Assumption: a category is required. Confirm with the team.
  Scenario: Save without a category
    Given the Coordinator is reviewing the report
    When the Coordinator saves the report without selecting a category
    Then the system shall not save the changes
    And ask the Coordinator to select a category
