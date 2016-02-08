@borrower_views_how_to_proceed_page
Feature: Borrower Views How to Proceed Page

Acceptance Criteria
    (US55) Page content matches wireframe

@us55
Scenario: Borrower Views How to Proceed Page
    Given I have valid deed data with <1> borrowers
    And I create the deed via the Deed API
    And I retrieve the deed id
    And I retrieve the unique user id using the URL
    When I navigate to the borrower frontend "/borrower-reference" page
    And I search for the deed using the unique borrower reference
    And I enter the borrowers date of birth
    Then the "View your mortgage deed" page is displayed
    And instructions for viewing your mortgage should be displayed
    And when I click on the "Continue" link
    Then the Your mortgage deed page is displayed