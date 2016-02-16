@borrowers_submits_email_feedback

Feature: Borrower can submit feedback via email link
In order for borrower to be able to provide feedback on the digital mortgage service
A way of providing feedback must be provided.

Acceptance Criteria:
(US104)Text on page: "Please submit feedback by email"

@us104
Scenario: Text Please submit feedback by email is shown on page
Given I have valid deed data with <1> borrowers
And I create the deed via the Deed API
And I retrieve the deed id
And I retrieve the unique user id using the URL
When I navigate to the borrower frontend "/borrower-reference" page
And I search for the deed using the unique borrower reference
And I enter the borrowers date of birth
And when I click on the "Continue" link
And the mortgage deed is displayed
And I confirm the mortgage deed
And a confirmation page is displayed
Then the text "How could we improve this service?" is displayed on the page
