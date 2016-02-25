@borrower_confirms_deed

Feature: Borrower confirms the Deed
  As a Borrower
  I want to confirm my mortgage deed
  So that I can complete the remortgage process

@us133a @us133
Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
