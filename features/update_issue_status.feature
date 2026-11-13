Feature: Update issue status


Scenario: Successfully update an issue status
Given the Coordinator is logged in
And an issue with status New exists
When the Coordinator changes its status to In Progress
Then the system saves the new status
And the Reporter can see the updated status


Scenario: Attempt to update an issue with an invalid status
Given the Coordinator is logged in
And an issue exists
When the Coordinator attempts to set an invalid status
Then the system rejects the status update
And the issue status remains unchanged

