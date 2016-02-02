@borrower_enters_dob
Feature: Borrower Enters Date of Birth

Acceptance Criteria:
  (US103) Date of birth must be in the format DD/MM/YYYY
  (US145) Date of birth cannot be a future date
  (US103) If an invalid date of birth is supplied then an error will be displayed on the page
  (US151) Message must be displayed if no deed is found matching Borrower ID and Date of birth
  (US151) Wording should be as in prototype.

@us103
Scenario: Borrower Enters an Invalid Date
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower token
  When I enter a date of birth that is not in a uk date format
  Then the error "Please enter a valid date of birth" should be displayed

@bug
Scenario: Borrower Enters Date in Different Format
  Given I have deed data with a borrowers date of birth with leading zeros
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower token
  When I enter the borrowers date of birth without the leading zeros
  And when I click on the "Continue to mortgage" button
  Then the Your mortgage deed page is displayed

@us145
Scenario: Borrower Enters Future Date
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower token
  When I enter a date of birth that is in the future
  Then the error "Please enter a valid date of birth" should be displayed

@us151
Scenario: Borrower Enters Incorrect Date of Birth
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower token
  When I enter a date of birth that is not the borrowers
  Then the error "Unable to find your mortgage deed" should be displayed
  And help text explaining why your deed wasn't found is displayed
