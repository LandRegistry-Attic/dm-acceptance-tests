@business_process
Feature: Check Business Processes

This feature is a container for the more generic acceptance tests that cover
the main business processes of the digital mortgage service.

Scenario: Create Deed with Valid Data
  Given I have valid deed data with <1> borrowers
  When I create the deed via the Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with Two Borrowers
  Given I have valid deed data with <2> borrowers
  When I create the deed via the Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Borrower views their deed
  Given I have valid deed data
  And I create the deed via the Deed API
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  When I navigate to the borrower frontend "/searchdeed" page
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  Then the Your mortgage deed page is displayed
