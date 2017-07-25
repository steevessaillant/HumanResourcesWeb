Feature: HumanResourcesWeb
	Manage Registration and Login in the Human Resources website

Background: 
	Given that we have no user created in our application

@Bad Password
Scenario: Register a new user with a bad password
	Given I navigate to the Registration page
	When I execute the register command with a bad password
	Then The message "Passwords must have at least one non letter or digit character." should be displayed

@Passwords Are Not Matching
Scenario: Register a new user with a missing confirm password
	Given I navigate to the Registration page
	When I execute the register command with a missing confirm password
	Then The message "The password and confirmation password do not match." should be displayed

@Missing Password With ConfirmPassword
Scenario: Register a new user with a missing password
	Given I navigate to the Registration page
	When I execute the register command with a missing password but providing a confirm password
	Then The message "The password and confirmation password do not match." should be displayed
	#(server IIS francais)
	# And  The message "Le champ Password est requis" should be displayed
	# And The message "The Password field is required" should be displayed 

@Register with valid data
Scenario: Register a new user with valid data
	Given I navigate to the Registration page
	When I execute the register command with good data
	Then The browser url last segment should be "#"


