@us55

Feature: Check content on Borrower Landing Page

Acceptance Criteria
    Page content matches wireframe

Scenario Outline: Borrower arrives landing Page
    Given I reach the Borrower Identity Verified Page
    Then I should see the "Continue to mortgage" button
    And the following <Texts> should be displayed

    Examples:
      | Texts                                     |
      | "Read your mortgage details"              |
      | "Request a code"                          |
      | "Use the code to sign your mortgage deed" |
      | "don't need to sign a paper document"     |
