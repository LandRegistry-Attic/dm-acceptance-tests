@us109 @conveyancer_confirms_identity_checks

Feature: Conveyancer confirms identity checks complete

Acceptance Criteria
  Y creates the deed
  N returns the error message "not allowed to create"
  Anything else will fail as a Schema Failure.

Scenario: Create Deed with where the identity check is confirmed
  Given I have deed data where conveyancer has confirmed borrower identity check
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned
