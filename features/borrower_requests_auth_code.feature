@borrower_requests_auth_code
Feature: Borrower requests authentication code via SMS

Acceptance Criteria
(US46) Flow of pages must adhere to the 2-factor prototype flow
(US46)Code must be sent to the mobile phone number provided by the conveyancer
(US46) Text message must contain the unique 6 character authentication code
followed by the words 'is your digital mortgage authentication code'.

@us46
Scenario: Sign my mortgage page tells borrower they need their mobile phone
  Given I navigate to the borrower frontend "/sign-my-mortgage" page
  Then the text "the mobile phone you registered with your conveyancer" is displayed on the page

@us46
Scenario: Borrower Requests Auth Code to sign deed
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the borrower <1> signature element is present on page
  Then the deed is digitally signed by borrower <1>
