@us5 @provide_borrower_names
Feature: Provide Borrower Names

Acceptance Criteria
  Borrowers names include:-
    First Name
    Middle Name (Optional)
    Surname
  There is no upper limit and there must be a least 1
  Successful and unsuccessful response must be returned

Scenario: Create Deed with a Borrower with a Middle Name
  Given I have deed data with a borrower with a middle name
  When I create the deed via the Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with No Borrowers
  Given I have deed data with no borrowers
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'minItems' in schema['properties']['borrowers']:"

Scenario: Create Deed with Invalid Borrower
  Given I have deed data with a borrower with no name
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['surname']:"
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['forename']:"
