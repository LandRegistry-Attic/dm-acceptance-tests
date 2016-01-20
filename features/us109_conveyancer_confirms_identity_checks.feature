@us109 @conveyancer_confirms_identity_checks

Feature: Conveyancer confirms identity checks complete

Acceptance Criteria
  Y creates the deed
  N returns the error message "not allowed to create"
  Anything else will fail as a Schema Failure.

Scenario: Create Deed where the identity check is confirmed
  Given conveyancer wants to confirm borrower identity check
  When I create the deed via the Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed where the identity check has a value of N
  Given conveyancer is not confirming borrower identity check
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "not allowed to create"

Scenario: Create Deed where the identity check has an invalid value blah
  Given conveyancer has submitted an invalid identity check value
  When I create the deed via the Deed API
  Then a status code of "400" is returned

Scenario: Create Deed where the identity check has no value
  Given conveyancer has submitted an empty identity check value
  When I create the deed via the Deed API
  Then a status code of "400" is returned
