@borrower_views_confirm_your_mortgage_page
Feature: Visual Feedback that SMS has been sent

Acceptance criteria
(us225) User is provided with a visual cue on screen informing them that their request for an SMS code has been successful and a code is on its way

@us225
Scenario: Borrower views Confirm your mortgage deed page
  Given I create default deed with <1> borrowers
  When I view the confirm your mortgage deed page
  Then the text "This may take a few minutes to arrive depending on the mobile signal in your area." is displayed on the page
