@lr_retrieves_pdf
Feature: Land Registry Retrieves Deed PDF
  In order to retrieve a PDF of a digital mortgage deed
  The deed store must be capable of being searched via deed ID
  so that another service can use the PDF deed

Acceptance Criteria:
  (US153a) A search of the deed store can be made using a single deed ID
  (US153a) When a single deed is found the service must return a PDF of the deed
  (US153a) The service must state when no deed with that deed ID exists

@us153a
Scenario: Retrieve PDF for Valid Deed ID
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And the deed id is returned by the Deed API
  When I retrieve a pdf using the deed id
  Then the PDF is returned

@us153a
Scenario: Retrieve PDF for Invalid Deed ID
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And the deed id is returned by the API
  When I retrieve a pdf using an incorrect deed id
  Then a status code of "404" is returned