Feature: create administrators 
	
	As an administrator
	I would like to add other administrators to the database
	So that I could know who the administrators are.
	
	Scenario: Successfully create administrators
		Given I am on the homepage
		When I click "Administrators"
		Then I should be on the administrators page
		When I click "Add New Administrator"
		Then I should be on the create new Administrator page
		When I fill in "Name" with "Jeff"
		When I fill in "Account" with "Jeff"
		When I fill in "Password" with "1234"
		And I press "Create Administrator"
		Then I should be on the administrators page
		Then I should see "Administrator Jeff was successfully created."
		And I should see "Jeff"