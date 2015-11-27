@business_process
Feature: Check Business Processes

This feature is a container for the more generic acceptance tests that cover
the main business processes of the digital mortgage service.

Scenario: Create Deed with Valid Data
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
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
