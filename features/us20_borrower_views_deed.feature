@us20 @borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

Background:
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API

Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref

  When I navigate to the borrower frontend "/searchdeed" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower token
  Then the Your mortgage deed page is displayed

Scenario: Borrower enters invalid deed reference

  - information message displayed when incorrect id entered

  When I navigate to the borrower frontend "/searchdeed" page
  And I search for an invalid deed
  Then the "Deed was not found for:" page is displayed
