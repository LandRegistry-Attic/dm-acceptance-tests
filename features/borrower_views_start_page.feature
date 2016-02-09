@borrower_views_start_page
Feature: Borrower Views Start Page

Acceptance Criteria
    (US75) Page content matches wireframe

@us75
Scenario: Borrower Views Start Page
    Given I navigate to the borrower frontend "/sign-my-mortgage" page
    Then information about the service and how to use it is displayed
    And when I click on the "Start now" link
    Then the "What is your borrower reference?" page is displayed
