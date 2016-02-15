@borrowers_view_and_sign_deed

Feature: Borrowers can view and sign a deed
As a borrower/borowers I need to confirm that the details of my mortgage deed are correct
So that the mortgage can proceed to the next stage.
-- SPECIFIC SIGNATURE & CONFIRMATION PAGE CHECKS TBC --

Acceptance Criteria:
(US133) Each borrower must be able to confirm the details are correct.
(US133) By confirming the details are correct, the deed is digitally signed.
(US133) Confirmation Message displayed to borrower on a subsequent page.
(US133) Each borrower must be able to view a deed multiple times but must only be able to confirm the details once.
(US133) When the deed is viewed subsequently it will show that the relevant borrower has confirmed the deed.

@us133 @wip1 @wipAll
Scenario: Single borrower views and signs deed, then views again
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <1> views the deed again
  Then I verify borrower <1> has signed the deed
  Then the mortgage deed is displayed

@us133 @wip1 @wipAll
Scenario: Single borrower views deed, then views and signs
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  And borrower <1> views the deed again
  Then the deed is digitally signed by borrower <1>

@us133 @wip1 @wipAll
Scenario: Single borrower views deed 3 times
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  And borrower <1> views the deed again
  And borrower <1> views the deed again
  Then the mortgage deed is displayed

@us133 @wip2 @wipAll
Scenario: 2 Borrowers can view and sign a deed
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <2> views the deed again
  Then I verify borrower <1> has signed the deed
  Then the deed is digitally signed by borrower <2>

@us133 @wip2 @wipAll
Scenario: 1st Borrower can view a deed, 2nd signs, then 1st views and signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  And borrower <2> views the deed again
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <1>

@us133 @wip2 @wipAll
Scenario: 2nd Borrower can view a deed, 1st signs, then 2nd views and signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the deed is digitally signed by borrower <1>
  And borrower <2> views the deed again
  Then I verify borrower <1> has signed the deed
  Then the deed is digitally signed by borrower <2>

@us133 @wip2 @wipAll
Scenario: 1st Borrower can sign a deed, 2nd views, then 2nd views and signs, 1st views signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <2> views the deed again
  Then I verify borrower <1> has signed the deed
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then I verify borrower <1> has signed the deed
  Then the mortgage deed is displayed

@us133 @wip2 @wipAll
Scenario: 2nd Borrower can sign a deed, 1st views, then 1st views and signs, 2nd views
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <2> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed

@us133 @wip3 @wipAll
Scenario: 3 Borrowers can view a deed
  Given I have valid deed data with <3> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <3> views the deed again
  Then the mortgage deed is displayed

@us133 @wip3 @wipAll
Scenario: 3 Borrowers can view and sign a deed (2nd,3rd,1st)
  Given I have valid deed data with <3> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the deed is digitally signed by borrower <2>
  And borrower <3> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <3>
  And borrower <1> views the deed again
  Then I verify borrower <3> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <1>

@us133 @wip3 @wipAll
Scenario: 3 Borrowers can view and sign a deed (2nd,1st,3rd)
  Given I have valid deed data with <3> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <3> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <3>

@us133 @wip3 @wipAll
Scenario: 3 Borrowers can view deed mutltiple times, and sign once
  Given I have valid deed data with <3> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  Then the deed is digitally signed by borrower <2>
  And borrower <3> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then I verify borrower <3> has signed the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <3> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <3>

@us133 @wip3 @wipAll
Scenario: 3 Borrowers can view deed mutltiple times, and sign once
  Given I have valid deed data with <3> borrowers
  And I create the deed via the Deed API

  And borrower <3> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the deed is digitally signed by borrower <1>
  And borrower <2> views the deed again
  Then the mortgage deed is displayed
  And borrower <3> views the deed again
  Then the deed is digitally signed by borrower <3>
  And borrower <2> views the deed again
  Then I verify borrower <3> has signed the deed
  Then I verify borrower <1> has signed the deed
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then I verify borrower <3> has signed the deed

@us133 @wip4 @wipAll
Scenario: 4 Borrowers can view a deed
  Given I have valid deed data with <4> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And borrower <4> views the deed again
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <3> views the deed again
  Then the mortgage deed is displayed

@us133 @wip4 @wipAll
Scenario: 4 Borrowers can view and sign a deed
  Given I have valid deed data with <4> borrowers
  And I create the deed via the Deed API
  And borrower <3> views the deed
  Then the deed is digitally signed by borrower <3>
  And borrower <2> views the deed again
  Then I verify borrower <3> has signed the deed
  Then the deed is digitally signed by borrower <2>
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then I verify borrower <3> has signed the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <4> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then I verify borrower <3> has signed the deed
  Then the deed is digitally signed by borrower <4>

@us133 @wip4 @wipAll
Scenario: 4 Borrowers can view and sign a deed
  Given I have valid deed data with <4> borrowers
  And I create the deed via the Deed API
  And borrower <1> views the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <3> views the deed again
  Then I verify borrower <1> has signed the deed
  Then the deed is digitally signed by borrower <3>
  And borrower <4> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <3> has signed the deed
  Then the deed is digitally signed by borrower <4>
  And borrower <2> views the deed again
  Then I verify borrower <3> has signed the deed
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <4> has signed the deed
  Then the deed is digitally signed by borrower <2>

@us133 @wip4 @wipAll
Scenario: 4 Borrowers can view deed multiple times, and sign once
  Given I have valid deed data with <4> borrowers
  And I create the deed via the Deed API
  And borrower <4> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the deed is digitally signed by borrower <2>
  And borrower <3> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <1>
  And borrower <3> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <4> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <4>
  And borrower <3> views the deed again
  Then I verify borrower <2> has signed the deed
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <4> has signed the deed
  Then the deed is digitally signed by borrower <3>

@us133 @wip4 @wipAll
Scenario: 4 Borrowers can view deed multiple times, and sign once
  Given I have valid deed data with <4> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then the mortgage deed is displayed
  And borrower <2> views the deed again
  Then the deed is digitally signed by borrower <2>
  And borrower <3> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <1> views the deed again
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  Then the deed is digitally signed by borrower <1>
  And borrower <3> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the mortgage deed is displayed
  And borrower <4> views the deed again
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <4>
  And borrower <3> views the deed again
  Then I verify borrower <4> has signed the deed
  Then I verify borrower <1> has signed the deed
  Then I verify borrower <2> has signed the deed
  Then the deed is digitally signed by borrower <3>

@us133 @wip5
Scenario: WIP for checking signature
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  And borrower <2> views the deed
  And the deed is digitally signed by borrower <2>
  And borrower <2> views the deed again
  Then I verify borrower <2> has signed the deed
