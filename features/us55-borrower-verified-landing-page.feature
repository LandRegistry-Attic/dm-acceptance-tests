Feature: Check content on Borrower Landing Page

Acceptance Criteria
    Page content matches wireframe

Scenario Outline: Borrower arrives landing Page
    Given I reach the Borrower Identity Verified Page
    Then I should see <Link_button>
    And the following <Texts>

    Examples:
      | Link_button               | Texts                      |
      | Continue to mortgage | Read your mortgage details |
