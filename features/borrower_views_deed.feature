@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

Acceptance Criteria:
  Deed must display:
    - Borrowers
    - Title number
    - e-MD ref
    (US85a)Property address
    - Additional provision
    - Lender
    - Charging clause
  (US121) Date box is displayed on the deed
  (US121) Have text on screen which says: " This charge takes effect when the registrar receives notification from [name of conveyancer preparing the charge] that the charge is to take effect."
  (US122) The borrower signature boxes must align with how they are formatted on the prototype
  (US122) Must accept one to four borrowers

@us20 @us119 @us85a @us133a @us121 @us133 @us188
Scenario: Borrower enters a valid deed reference
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  Then the borrower signature elements are present on page
  And confirm your deed information text is displayed on the deed page

@us122 @us133
Scenario: 4 Borrower signature boxes are displayed on the deed
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  Then the borrower signature elements are present on page
