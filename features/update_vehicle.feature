Feature: Update vehicle 
	
	As an administrator
	In order to manage the vehicles we have
	I would like to update vehicles to the database
	
	Background:
		Given the vehicle Car1 exist

	Scenario: Successfully update vehicle
		Given I am on the homepage
		When I click "Vehicles"
		Then I should be on the vehicles page
		When I click "Update Car1"
		Then I should see "Edit Vehicle Car1"
		When I fill in "vehicle_name" with "Car2"
		When I press "Update Vehicle Info"
		Then I should be on the vehicles page
		And I should see "Car2 was successfully updated"
		And I should see "Car2"
		
