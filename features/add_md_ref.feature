@add_md_ref
Feature: Coveyancer provides MD ref
  As a Conveyancer
  I want to provide an MD reference
  So that the correct Mortgage Deed can be created


Acceptance Criteria
    Only 1 MD ref can be supplied
    The format of the NEW MD ref is e-MD appended with 5 numerics, or, 3 or 4
    numbers appended with 1 Alpha valid numerics 1-9 Alphas A-Z



Scenario: Create a deed with Mortgage Document reference
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "md_ref": "e-MD12345",
      "borrowers": [
         {
             "forename": "Katie",
             "middle_name": "Elizabeth",
             "surname": "Kicks",
             "gender": "Male",
             "address": "1 The High Street Highley PL6 7TG",
             "dob": "11/01/2000",
             "phone_number": "07507154077"


         }
      ]

    }
    """
    Then a status code of "201" is returned

Scenario: Create a deed with two Mortgage Document references
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "md_ref": "e-MD12345, e-MD1234Z",
      "borrowers": [
          {
              "forename": "Katie",
              "middle_name": "Elizabeth",
              "surname": "Kicks",
              "gender": "Male",
              "address": "1 The High Street Highley PL6 7TG",
              "dob": "11/01/2000",
              "phone_number": "07507154077"


          }
      ]

    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

Scenario: Create a deed with Mortgage Document reference consisting of 5 numerics
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "md_ref": "e-MD12345",
      "borrowers": [
         {
             "forename": "Katie",
             "middle_name": "Elizabeth",
             "surname": "Kicks",
             "gender": "Male",
             "address": "1 The High Street Highley PL6 7TG",
             "dob": "11/01/2000",
             "phone_number": "07507154077"


         }
      ]

    }
    """
    Then a status code of "201" is returned

Scenario: Create a deed with Mortgage Document reference consisting of 3 numerics appended with 1 alpha character
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "md_ref": "e-MD123G",
      "borrowers": [
         {
             "forename": "Katie",
             "middle_name": "Elizabeth",
             "surname": "Kicks",
             "gender": "Male",
             "address": "1 The High Street Highley PL6 7TG",
             "dob": "11/01/2000",
             "phone_number": "07507154077"


         }
      ]

    }
    """
    Then a status code of "201" is returned

Scenario: Create a deed with an invalid mortgage document reference
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "md_ref": "e-MD123456",
      "borrowers": [
          {
              "forename": "Katie",
              "middle_name": "Elizabeth",
              "surname": "Kicks",
              "gender": "Male",
              "address": "1 The High Street Highley PL6 7TG",
              "dob": "11/01/2000",
              "phone_number": "07507154077"


          }
      ]

    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

Scenario: Create a deed without a mortgage document reference
    Given I add the following deed:
    """
    {
      "title_number": "DT567568",
      "borrowers": [
          {
              "forename": "Katie",
              "middle_name": "Elizabeth",
              "surname": "Kicks",
              "gender": "Male",
              "address": "1 The High Street Highley PL6 7TG",
              "dob": "11/01/2000",
              "phone_number": "07507154077"


          }
      ]

    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "'md_ref' is a required property"
