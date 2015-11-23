@us55

Feature: Check content on Borrower Landing Page

Acceptance Criteria
    Page content matches wireframe

Scenario Outline: Borrower arrives landing Page
    Given I reach the Borrower Identity Verified Page
    Then I should see <Link_button>
    And the following <Texts>

    Examples:
      | Link_button            | Texts                                     |
      | "Continue to mortgage" | "Read your mortgage details"              |
      | ""                     | "Request a code"                          |
      | ""                     | "Use the code to sign your mortgage deed" |
      | ""                     | "don't need to sign a paper document"     |
