@borrower_views_how_to_proceed_page
Feature: Borrower Views How to Proceed Page

Acceptance Criteria
    (US55) Page content matches wireframe

@us55
Scenario: Borrower Views How to Proceed Page
    Given I create default deed with <1> borrowers
    And I retrieve the unique user id for borrower <1>
    And I navigate to the borrower frontend "/borrower-reference" page
    And I search for the deed using the unique borrower reference
    And I enter the date of birth for borrower <1>
    And instructions for viewing your mortgage should be displayed
    And when I click on the "Continue" link
    Then the mortgage deed is displayed
