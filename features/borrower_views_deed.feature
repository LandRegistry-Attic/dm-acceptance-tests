@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it



  @delete_test_data
  Scenario: Borrower enters invalid deed reference

      - information message displayed when incorrect id entered

  Given I navigate to the borrower frontend "/deed/search" page
  When I search for an invalid deed
  Then the "Deed not found" page is displayed
