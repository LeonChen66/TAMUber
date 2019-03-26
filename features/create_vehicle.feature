Feature: create vehicle 
	
	As an administrator
	In order to manage the vehicles we have
	I would like to create vehicles to the database
	
	Scenario: Successfully create vehicle
		Given I am on the homepage
		When I click "Vehicles"
		Then I should be on vehicles page
		When I click "Add New Vehicle"
		Then I should be on the create new vehicle page
		When I fill in "Name" with "Car1"
		And I press "Create Vehicle"
		Then I should be on the vehicles page
		Then I should see "Car1 was successfully created."
		And I should see "Car1"
