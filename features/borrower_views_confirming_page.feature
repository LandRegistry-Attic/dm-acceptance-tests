@borrower_views_confirming_page

Feature: After Borrower enters authentication code, page displayed to inform the borrower that is is processing the confirmation
  As a Borrower
  I want a visual cue on screen
  So that I know my request to sign the deed has been acknowledged and is processing

@us226
Scenario: Borrower views Confirming page
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  When I request an authentication code for borrower <1>
  And I retrieve and enter the authentication code for the borrower
  Then The confirming in progress page is displayed
