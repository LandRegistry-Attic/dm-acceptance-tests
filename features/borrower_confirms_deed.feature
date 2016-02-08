@borrower_confirms_deed

Feature: Borrower confirms the Deed
  As a Borrower
  I want to confirm my mortgage deed
  So that I can complete the remortgage process

@us133a
Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  When I navigate to the borrower frontend "/borrower-reference" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower reference
  And I enter the borrowers date of birth
  And when I click on the "Continue" link
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
