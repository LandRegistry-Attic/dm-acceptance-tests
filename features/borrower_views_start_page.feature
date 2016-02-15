@borrower_views_start_page
Feature: Borrower Views Start Page

Acceptance Criteria
    (US75) Page content matches wireframe
    (US150) Need to provide a link to the Personal Information Charter

Background:
    Given I navigate to the borrower frontend "/sign-my-mortgage" page
    Then information about the service and how to use it is displayed

@us75
Scenario: Borrower Views Start Page
    And when I click on the "Start now" link
    Then the "What is your borrower reference?" page is displayed

@us150
Scenario: Text displayed to conform with Data Protection Law
    And the conform with Data Protection Law text is displayed
    And a link to Personal Information Charter is displayed
