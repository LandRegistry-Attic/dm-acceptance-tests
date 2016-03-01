@us109 @conveyancer_confirms_identity_checks

Feature: Conveyancer confirms identity checks complete

Acceptance Criteria
  Y creates the deed
  Anything else will fail as a Schema Failure.

@us109
Scenario: Create Deed where the identity check has a value of N
  Given I setup a deed with <1> borrowers
  And I amend "identity_checked" to "N"
  When I create the deed via the Deed API
  Then a status code of "400" is returned

@us109
Scenario: Create Deed where the identity check has no value
  Given I setup a deed with <1> borrowers
  And I amend "identity_checked" to ""
  When I create the deed via the Deed API
  Then a status code of "400" is returned
