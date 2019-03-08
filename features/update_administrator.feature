Feature: Update administrator 
	
	As an administrator
	I would like to edit administrators’ information
	So that I could keep their information updated.
	
	Background:
		Given the administrator Jeff exist

	Scenario: Successfully update vehicle
		Given I am on the homepage
		When I click "Administrators"
		Then I should be on the administrators page
		When I click "Update Jeff"
		Then I should see "Edit Administrator Jeff"
		When I fill in "Name" with "Jack"
		When I press "Update Administrator Info"
		Then I should be on the administrators page
		And I should see "Administrator Jack was successfully updated"
		And I should see "Jack"
		And I should not see "Jeff"
