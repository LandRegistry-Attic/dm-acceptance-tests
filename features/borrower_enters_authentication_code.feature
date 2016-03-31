@borrower_enters_authentication_code
Feature: Borrower Enters Authentication Code

Acceptance Criteria:
  -Authentication code can only be used once
  -Error message must be displayed if code is entered wrongly

#@us189b
#Scenario: Borrower enters incorrect authentication code
 # Given I create default deed with <1> borrowers
  #And borrower <1> views the deed
  #And the mortgage deed is displayed
  #And I request an authentication code for borrower <1>
  #And the text "Enter your authentication code" is displayed on the page
  #When I enter the wrong authentication code
  #Then the error "Unable to confirm your deed" should be displayed
  #And the text "The authentication code you entered was not recognised, it may have been mistyped." is displayed on the page
  #And the text "Or the authentication you entered may have expired, codes are only valid for a period of ten minutes." is displayed on the page

@us189b
Scenario: Authentication code cannot be reused
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the borrower <1> signature element is present on page
  Then the deed is digitally signed by borrower <1>
  And borrower <1> views the deed
  And the mortgage deed is displayed
  And I verify borrower <1> has signed the deed
  And when I click on the "Continue" button
  Then a confirmation page is displayed