Feature: Delete administrator 
	
	As an administrator
	I would like to delete other administrators from the database
	So that I could see if any administrator quits.
	
	Background:
		Given the administrator Jeff exist

	Scenario: Successfully delete vehicle
		Given I am on the homepage
		When I click "Administrators"
		Then I should be on the administrators page
		When I press "Delete Jeff"
		Then I should see "Jeff was successfully deleted"
		Then I should not see "Delete Jeff"