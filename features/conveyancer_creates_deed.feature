@business_process
Feature: Check Business Processes

This feature is a container for the more generic acceptance tests that cover
the main business processes of the digital mortgage service.

Scenario: Create Deed with Valid Data
  Given I create default deed with <1> borrowers
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with Two Borrowers
  Given I create default deed with <1> borrowers
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned
