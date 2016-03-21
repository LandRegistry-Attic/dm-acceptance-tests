@borrowers_view_and_sign_deed

Feature: Borrowers can view and sign a deed
As a borrower/borrowers I need to confirm that the details of my mortgage deed are correct
So that the mortgage can proceed to the next stage.

Acceptance Criteria:
(US133) Each borrower must be able to confirm the details are correct.
(US133) By confirming the details are correct, the deed is digitally signed.
(US133) Confirmation Message displayed to borrower on a subsequent page.
(US133) Each borrower must be able to view a deed multiple times but must only be able to confirm the details once.
(US133) When the deed is viewed subsequently it will show that the relevant borrower has confirmed the deed.

@us133 @us133f
Scenario: Single borrower views and signs deed, then views
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the borrower <1> signature element is present on page
  Then the deed is digitally signed by borrower <1>
  And borrower <1> views the deed
  And the mortgage deed is displayed
  Then I verify borrower <1> has signed the deed

@us133 @us133f
Scenario: Single borrower views deed 3 times
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And borrower <1> views the deed
  Then borrower <1> views the deed
  
@us2133 @us133f
Scenario: 2 Borrowers can view a deed.
  Given I create default deed with <2> borrowers
  And borrower <2> views the deed
  And borrower <1> views the deed

@us133 @us133f
Scenario: 3 Borrowers can view a deed.
  Given I create default deed with <3> borrowers
  And borrower <2> views the deed
  And borrower <1> views the deed
  Then borrower <3> views the deed

@us133 @us133f
Scenario: 4 Borrowers can view a deed
  Given I create default deed with <4> borrowers
  And borrower <2> views the deed
  And borrower <4> views the deed
  And borrower <1> views the deed
  Then borrower <3> views the deed