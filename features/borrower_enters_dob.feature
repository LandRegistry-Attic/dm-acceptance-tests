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
  Given I create default deed with <1> borrowers
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower reference
  When I enter "09/30/2015" as the date of birth
  Then the error "Please enter a valid date of birth" should be displayed

@bug
Scenario: Borrower Enters Date in Different Format
  Given I setup a deed with <1> borrowers
  And I amend "dob" to "01/08/2015" for borrower <1>
  And I create the deed
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower reference
  When I enter "1/8/2015" as the date of birth
  And when I click on the "Continue" link
  Then the mortgage deed is displayed

@us145
Scenario: Borrower Enters Future Date
  Given I create default deed with <1> borrowers
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower reference
  When I enter "01/12/2030" as the date of birth
  Then the error "Please enter a valid date of birth" should be displayed

@us151
Scenario: Borrower Enters Incorrect Date of Birth
  Given I create default deed with <1> borrowers
  And I create the deed via the Deed API
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  And I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower reference
  When I enter "11/01/1990" as the date of birth
  And help text explaining why your deed wasn't found is displayed
