@us6
Feature: Add Title Number to Deed
    As a Conveyancer I need to provide the Title Number
    So that the it can be added to the mortgage deed

Acceptance Criteria
    BRL-DM-1 Only 1 title number can be provided
    BRL-DM-2 Title number must be in title number format.
    Response code returned for successful and unsuccessful request
    A link to the resource must be returned as part of the response

Scenario: Add Valid Title Number
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

Scenario: Add Multiple Title Numbers
    Given I add the following deed:
    """
    {
      "title_number": "DT567568DN573253",
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
    Then a status code of "400" is returned

Scenario: Add Invalid Title Number
    Given I add the following deed:
    """
    {
      "title_number": "ABCD1234/D",
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
    Then a status code of "400" is returned
