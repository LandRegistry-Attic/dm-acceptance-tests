@us5
Feature: Provide Borrower Names

Acceptance Criteria
  Borrowers names include:-
    First Name
    Middle Name (Optional)
    Surname
  There is no upper limit and there must be a least 1
  Successful and unsuccessful response must be returned

Scenario: Create Deed with a Borrower with No Middle Name
  Given I add the following deed:
  """
  {
    "title_number": "DT567568",
    "md_ref": "e-MD123G",
    "borrowers": [
      {
           "forename": "Paul",
           "middle_name": "",
           "surname": "Smythe",
           "gender": "Male",
           "address": "2 The Street, Plymouth, PL1 2PP",
           "dob": "01/10/1976",
           "phone_number": "07502154062"
       }
    ]
  }
  """
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with a Borrower with a Middle Name
  Given I add the following deed:
  """
  {
    "title_number": "DT567568",
    "md_ref": "e-MD123G",
    "borrowers": [
      {
           "forename": "Paul",
           "middle_name": "Johnny",
           "surname": "Smythe",
           "gender": "Male",
           "address": "2 The Street, Plymouth, PL1 2PP",
           "dob": "01/10/1976",
           "phone_number": "07502154062"
       }
    ]
  }
  """
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned

Scenario: Create Deed with No Borrowers
  Given I add the following deed:
  """
  {
    "title_number": "DT567568",
    "borrowers": []
  }
  """
  Then a status code of "400" is returned

Scenario: Create Deed with Invalid Borrower
  Given I add the following deed:
  """
  {
    "title_number": "DT567568",
    "md_ref": "e-MD123G",
    "borrowers": [
      {
           "forename": "",
           "middle_name": "",
           "surname": "",
           "gender": "Male",
           "address": "2 The Street, Plymouth, PL1 2PP",
           "dob": "01/10/1976",
           "phone_number": "07502154062"
       }
    ]
  }
  """
  Then a status code of "400" is returned
