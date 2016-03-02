@borrowers_submits_email_feedback

Feature: Borrower can submit feedback via email link
In order for borrower to be able to provide feedback on the digital mortgage service
A way of providing feedback must be provided.

Acceptance Criteria:
(US104)Text on page: "How could we improve this service?"

@us104
Scenario: Text "How could we improve this service?" is shown on page
Given I create default deed with <1> borrowers
And borrower <1> views the deed
Then the deed is digitally signed by borrower <1>
Then the text "How could we improve this service?" is displayed on the page
Then a link to submit email feedback is displayed
