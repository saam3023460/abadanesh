Feature: Attach Images to a Report
  As a reporter
  I want to attach images while providing my report information
  So that I can provide visual evidence or additional context about the reported issue

  Background:
    Given I am an authenticated reporter
    And I am submitting a report

  Scenario: Successfully attach images
    When I select one or more supported image files
    Then the system shall attach those images to the report
    And display the selected images as part of the report information

  Scenario: Remove an attached image before submission
    Given I have attached one or more images to my report
    When I remove a selected image
    Then the system shall remove that image from the report submission
    And retain the other report information and attached images

  Scenario: Reject an unsupported image format
    When I attempt to attach a file in an unsupported format
    Then the system shall reject the file
    And inform me that the selected file format is unsupported

  Scenario: Submit a report without images
    Given I have provided all other required report information
    When I submit the report without attaching any images
    Then the system shall allow the submission

