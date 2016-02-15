@borrowers_submits_email_feedback

Feature: Borrower can submit feedback via email link
In order for borrower to be able to provide feedback on the digital mortgage service
A way of providing feedback must be provided.

Acceptance Criteria:
(US104)Text on page: "Please submit feedback by email"
(US104)Text is a mailto link, directed to the group email.

@us104
Scenario: Text Please submit feedback by email is shown on page
Given I have valid deed data with <1> borrowers
And I create the deed via the Deed API
And borrower <1> views the deed
And the mortgage deed is displayed
And I confirm the mortgage deed
And a confirmation page is displayed
Then the text "Please submit feedback by email" is displayed on the page
