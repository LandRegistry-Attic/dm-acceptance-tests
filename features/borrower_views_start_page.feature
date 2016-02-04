@borrower_views_start_page
Feature: Borrower Views Start Page

Acceptance Criteria
    (US75) Page content matches wireframe

@us75
Scenario Outline: Borrower Views Start Page
    Given I navigate to the borrower frontend "/sign-my-mortgage" page
    Then the following <INFORMATION> should be displayed
    And when I click on the "Start now" link
    Then the "What is your borrower token?" page is displayed

    Examples:
      | INFORMATION                                           |
      | "Sign your mortgage deed"                             |
      | "To verify your identity using GOV.UK Verify"         |
      | "Why is the government involved in this?"             |
