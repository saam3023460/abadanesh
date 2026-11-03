Feature: Submit an issue


Scenario: Successfully submit an issue
Given the Reporter is logged in
And the Reporter has selected a category
And the Reporter has entered a description and location
When the Reporter submits the issue
Then the system saves the issue
And the issue status is New
And the issue appears in the Reporter's report list


Scenario: Submit an issue without a description
Given the Reporter is logged in
And the Reporter has selected a category
And the description is empty
When the Reporter submits the issue
Then the system prevents submission
And the system displays a validation error

