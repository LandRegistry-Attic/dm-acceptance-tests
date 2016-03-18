@us6 @add_title_number
Feature: Add Title Number to Deed
  As a Conveyancer I need to provide the Title Number
  So that the it can be added to the mortgage deed

Acceptance Criteria
  BRL-DM-1 Only 1 title number can be provided
  BRL-DM-2 Title number must be in title number format.
  Response code returned for successful and unsuccessful request
  A link to the resource must be returned as part of the response

@us6
Scenario: Add Multiple Title Numbers
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "DMA6758, DMA7353"
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['title_number']:"

@us6
Scenario: Add Invalid Title Number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "ABCD1234/D"
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['title_number']:"
