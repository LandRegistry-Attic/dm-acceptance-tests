@borrower_enters_reference
Feature: Borrower Enter Reference

Acceptance Criteria
  (US151) Message must be displayed if no deed is found matching Borrower ID and Date of birth
  (US151) Wording should be as in prototype.

@us20 @us151
Scenario: Borrower enters incorrect deed reference
  Given I create default deed with <1> borrowers
  When I navigate to the borrower frontend "/borrower-reference" page
  And I search for a deed using an incorrect borrower reference
  And I enter the date of birth
  Then the error "Unable to find your mortgage deed" should be displayed
  And help text explaining why your deed wasn't found is displayed
