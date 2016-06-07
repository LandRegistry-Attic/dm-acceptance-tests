@us5 @provide_borrower_names
Feature: Provide Borrower Names

Acceptance Criteria
  Borrowers names include:-
    First Name
    Middle Name (Optional)
    Surname
  There is no upper limit and there must be a least 1
  Successful and unsuccessful response must be returned

@us5
Scenario: Create Deed with No Borrowers
  Given I have valid deed data with <0> borrowers
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'minItems' in schema['properties']['borrowers']:"

@us5
Scenario: Create Deed with Invalid Borrower
  Given I setup a deed with <1> borrowers
  And I amend "forename" to "" for borrower <1>
  And I amend "surname" to "" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['surname']:"
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['forename']:"

@hotfix-allow-spec-char-names
Scenario: Create Deed with a Borrower with more than one forename, middle name, surname which also contains special characters
    Given I setup a deed with <1> borrowers
    And I amend "title_number" to "CYM123461"
    And I amend "forename" to "Ann-Marie" for borrower <1>
    And I amend "middle_name" to "Stacey Jane -Jones66" for borrower <1>
    And I amend "surname" to "A'thénaïs* de Ligne de la Trémoïlle" for borrower <1>
    And I create the deed
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned
