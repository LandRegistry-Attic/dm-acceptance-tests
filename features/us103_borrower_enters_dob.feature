@us103 @borrower_enters_dob
Feature: Borrower Enters Date of Birth

Acceptance Criteria:
  Date of birth must be in the format DD/MM/YYYY
  Date of birth cannot be a future date (BRL-DM-06, BRL-DM-07)
  If an invalid date of birth is supplied then an error will be displayed on the page

Background:
  Given I have valid deed data
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL

Scenario: Entered Date of Birth does not Match
  Given I navigate to the borrower frontend "/searchdeed" page
  And I search for the deed using the unique borrower token
  When I enter an incorrect date of birth
  Then the error "Date does not match" should be displayed

Scenario: Borrower Enters a Date in the Future
  Given I navigate to the borrower frontend "/searchdeed" page
  And I search for the deed using the unique borrower token
  When I enter a date of birth that is in the future
  Then the error "Date is in the future" should be displayed

Scenario: Borrower Enters an Invalid Date
  Given I navigate to the borrower frontend "/searchdeed" page
  And I search for the deed using the unique borrower token
  When I enter a date of birth that is not in a uk date format
  Then the error "Date is in invalid format" should be displayed

