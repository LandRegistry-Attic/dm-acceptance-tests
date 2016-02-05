@us121 @display-effective-date-elements
Feature: Display the effective date elements
  In order to create a legal mortgage
  A blank date box must be shown when the borrower views the deed.

Acceptance Criteria
-Date box is displayed on the deed
-Have text on screen which says:
  " This charge takes effect when the registrar receives notification from [name of conveyancer preparing the charge] that the charge is to take effect."

Scenario: Effective Date is displayed on the deed

  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  When I navigate to the borrower frontend "/borrower-reference" page
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  And when I click on the "Continue" link
  Then the effective date element is present on page
  And the text "This charge takes effect when the registrar receives notification from Pure Law that the charge is to take effect." is displayed on the page
