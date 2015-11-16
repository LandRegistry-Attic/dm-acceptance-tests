@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

  Background:
    Given I have created a deed with two borrowers

    @delete_test_data
      Scenario: Borrower enters a valid deed reference

            Deed must display:
             - Borrowers
             - Title number

      Given I navigate to the borrower frontend "/deed/search" page
      When I search for the created deed
      Then the “Your mortgage deed" page is displayed
      And the borrowers are displayed on the deed
      | BORROWERS               |
      | Peter Pickle            |
      | Susan Paula Hughes      |

      And the property is displayed on the deed
      | Title Number          |
      | DN12345               |



  @delete_test_data
  Scenario: Borrower enters invalid deed reference

      - information message displayed when incorrect id entered

  Given I navigate to the borrower frontend "/deed/search" page
  When I search for an invalid deed
  Then the "Deed not found" page is displayed
