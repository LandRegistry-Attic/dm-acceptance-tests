@us122 @display-borrower-signature-elements
Feature: Display the borrower signature elements
In order for the borrower to digitally sign the mortgage deed the mortgage deed must display the borrower signature elements.

Acceptance Criteria
The borrower signature boxes must align with how they are formatted on the prototype
Must accept one to four borrowers


Scenario: 1 Borrower signature box is displayed on the deed

  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  When I navigate to the borrower frontend "/searchdeed" page
  And I search for the deed using the unique borrower token
  Then <1> borrower signature element is on page

  Scenario: 4 Borrower signature box is displayed on the deed

    Given I have valid deed data with <4> borrowers
    And I create the deed via the Deed API
    And I retrieve the deed id
    And I retrieve the unique user id using the URL
    When I navigate to the borrower frontend "/searchdeed" page
    And I search for the deed using the unique borrower token
    Then <4> borrower signature element is on page
