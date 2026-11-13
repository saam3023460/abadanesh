@US-12 @R1 @Coordinator
Feature: US-12 View and filter incoming reports
  As a Coordinator,
  I want to view and filter incoming reports by status, category, and date,
  So that I can find the reports that need my attention.

  Background:
    Given the Coordinator is signed in
    And several reports exist with different statuses, categories, and dates

  Scenario: View all incoming reports
    When the Coordinator opens the incoming reports page
    Then the system shall list the reports
    And show the status, category, and date of each report

  Scenario: Filter reports by status
    When the Coordinator filters by the status "In Progress"
    Then the system shall show only reports with the status "In Progress"

  Scenario: Filter reports by category
    When the Coordinator filters by a category
    Then the system shall show only reports in that category

  Scenario: Filter reports by date range
    When the Coordinator filters by a date range
    Then the system shall show only reports created within that range

  Scenario: Combine several filters
    When the Coordinator filters by status, category, and date range together
    Then the system shall show only reports that match all selected filters

  Scenario: No report matches the filters
    When the Coordinator applies filters that match no report
    Then the system shall display an empty-result message
