@borrower_views_how_to_proceed_page
Feature: Borrower Views How to Proceed Page

Acceptance Criteria
    (US55) Page content matches wireframe

@us55
Scenario: Borrower Views How to Proceed Page
    Given I create default deed with <1> borrowers
    And borrower <1> views the deed
    And instructions for viewing your mortgage should be displayed
    And when I click on the "Continue" link
    Then the mortgage deed is displayed
