@borrower_confirms_deed

Feature: Borrower confirms the Deed
  As a Borrower
  I want to confirm my mortgage deed
  So that I can complete the remortgage process

@us133a @us133
Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  When I navigate to the borrower frontend "/borrower-reference" page
  And the deed id is returned by the Deed API
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower reference
  And I enter the borrowers date of birth
  And when I click on the "Continue" link
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed

@us133 @wip1
Scenario: Single borrower views and signs deed, then views again
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
  When I navigate to the borrower frontend "/borrower-reference" page
  And I retrieve the unique user id for borrower <1>
  And I search for the deed using the unique borrower reference
  And I enter the borrowers date of birth
  And when I click on the "Continue" link
  Then the mortgage deed is displayed
  #Shoud fail with below step
  #Then I confirm the mortgage deed

@us133 @wip2
Scenario: Single borrower views deed, then views and signs
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed

# Move to borrower_views_deed.feature
@us133 @wip2
Scenario: Single borrower views deed 3 times
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then borrower <1> views the deed
  Then the mortgage deed is displayed


@us133 @wip2
Scenario: 2 Borrowers can view and sign a deed
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
  Then borrower <2> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed

@us133 @wip2
Scenario: 1st Borrower can view a deed, 2nd signs, then 2st views and signs
  Given I have valid deed data with <2> borrowers
  And I create the deed via the Deed API
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then borrower <2> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
  Then borrower <1> views the deed
  Then the mortgage deed is displayed
  Then I confirm the mortgage deed
  And a confirmation page is displayed
