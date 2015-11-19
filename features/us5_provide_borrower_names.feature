Feature: Provide Borrower Names

Acceptance Criteria
  Borrowers names include:-
    First Name
    Middle Name (Optional)
    Surname
  There is no upper limit and there must be a least 1
  Successful and unsuccessful response must be returned

Scenario: Create Deed with a Borrower with No Middle Name
  Given I have a deed with a borrower with no middle name
  When I create a deed using Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with a Borrower with a Middle Name
  Given I have a deed with a borrower with a middle name
  When I create a deed using Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with No Borrowers
  Given I have a deed with no borrowers
  When I create a deed using Deed API
  Then a status code of "400" is returned

Scenario: Create Deed with Invalid Borrower
  Given I have a deed with an invalid borrower
  When I create a deed using Deed API
  Then a status code of "400" is returned
