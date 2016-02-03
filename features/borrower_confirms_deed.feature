@borrower_confirms_deed

Feature: Borrower confirms the Deed
  As a Borrower
  I want to confirm my mortgage deed
  So that I can complete the remortgage process

@us133a
Scenario: Borrower confirms deed

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  When I navigate to the borrower frontend "/searchdeed" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  Then the Your mortgage deed page is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
