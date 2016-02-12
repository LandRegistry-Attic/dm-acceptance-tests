@borrowers_view_and_sign_deed

Feature: Borrowers can view and sign a deed
As a borrower/borowers I need to confirm that the details of my mortgage deed are correct
So that the mortgage can proceed to the next stage.

Acceptance Criteria:
(US133) Each borrower must be able to confirm the details are correct.
(US133) By confirming the details are correct, the deed is digitally signed.
(US133) Confirmation Message displayed to borrower on a subsequent page.
(US133) Each borrower must be able to view a deed multiple times but must only be able to confirm the details once.
(US133) When the deed is viewed subsequently it will show that the relevant borrower has confirmed the deed.

@us133 @wip2
Scenario: Single borrower views and signs deed, then views again
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  #Shoud fail with below step when borrowers sign
  #Then I confirm the mortgage deed

@us133 @wip2
Scenario: Single borrower views deed, then views and signs
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed

# Move to borrower_views_deed.feature
@us133 @wip2
Scenario: Single borrower views deed 3 times
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed


@us133 @wip2
Scenario: 2 Borrowers can view and sign a deed
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed

@us133 @wip2
Scenario: 1st Borrower can view a deed, 2nd signs, then 1st views and signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed

@us133 @wip2
Scenario: 2nd Borrower can view a deed, 1st signs, then 2nd views and signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed

@us133 @wip2
Scenario: 1st Borrower can sign a deed, 2nd views, then 2nd views and signs, 1st views signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed

@us133 @wip2
Scenario: 2nd Borrower can sign a deed, 1st views, then 1st views and signs, 2nd views
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And I confirm the mortgage deed
  Then a confirmation page is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
