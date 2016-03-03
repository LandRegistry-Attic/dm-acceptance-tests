@add_property_address
  Feature: Conveyancer provides a single property address
  As a conveyancer I want to be able to provide a property address
  So that it can be included on the mortgage deed

Acceptance Criteria
  (us85)  Property provided must be a single property address
  (us85)  It needs to look like an address
  (us106) Commas provided in the address indicate a new line (apart from when it follows
          a number or a number followed by a letter in the first)
  (us106) Commas are not displayed on the address when borrower views deed

@us85a
Scenario: No property address provided
  Given I setup a deed with <1> borrowers
  And I amend "property_address" to ""
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['property_address']:"

@us106
Scenario: Input property address formatted with commas
  Given I have a property address that is formatted with commas
  When I create the deed via the Deed API
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  When I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower reference
  And I enter the date of birth
  And when I click on the "Continue" link
  Then the mortgage deed is displayed
