@add_property_address
  Feature: Conveyancer provides a single property address
  As a conveyancer I want to be able to provide a property address
  So that it can be included on the mortgage deed


Acceptance Criteria
  Property provided must be a single property address
  It needs to look like an address
  Commas provided in the address indicate a new line
  Commas are not displayed on the address when borrower views deed

@us85a
Scenario: No property address provided
  Given I do not have a property address to provide
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['address']:"

@us106
Scenario: Property address formatted with commas
  Given I have a property address that is formatted with commas
  When I create the deed via the Deed API
  When I navigate to the borrower frontend "/searchdeed" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  Then the Your mortgage deed page is displayed
  And the property address is displayed 

@us106
Scenario: Property address without formatting
  Given I create a deed with an input of "Amberleigh House High Street London SE3 4TG"
  When the borrower views the deed
  Then line 1 of the property address is displayed as "1 High Street"
  Then line 2 of the property address is displayed as "London"
  Then line 3 of the property address is displayed as "SE3 4TG"
