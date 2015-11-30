@us75

Feature: Check content on Borrower Start Page

Acceptance Criteria
    Page content matches wireframe

Scenario Outline: Borrower arrives start page
    Given I reach the borrower start page
    Then I should see the "Start now" button
    And the following <Texts> should be displayed
    And when I click on the "Start now" button
    Then I should reach the borrower identity verified page


    Examples:
      | Texts                                                                 |
      | "Sign your mortgage deed"                                             |
      | "To verify your identity using GOV.UK Verify"                         |
      | "Why is the government involved in this?"                             |
