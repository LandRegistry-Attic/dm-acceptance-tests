@us13
Feature: Coveyancer provides personal details
    As a Conveyancer
    I want to provide borrowers personal details
    So that they can be used in the matching and signing processes

Acceptance Criteria
    Borrowers details must include:
    Borrowers current address
    Borrowers mobile phone number
    Borrowers date of birth
    Borrowers gender (optional)
    This data does not form part of the mortgage deed and must be stored separately

Business Rules
  BRL-DM-03 - Borrowers address must be a single  postal address
  BRL-DM-04 Each Borrower can only have 1 mobile phone number
  BRL-DM-05 Each mobile phone number must be unique to the individual borrower within a single transaction.
  BRL-DM-06 - A borrowers date of birth cannot be a future date
  BRL-DM-07 The format of a date of birth must be DD/MM/YYYY and it must be a valid date.
  BRL-DM-08 Address is free format and must contain a UK postcode
  BRL-DM-09  Mobile phone number must  be in the  UK format
  BRL-DM-10 Gender will be M, F or U

Scenario: Create a deed with borrowers personal details
    Given I add the following deed:
    """
    {
    "title_number": "DT567568",
   "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "11/01/2000",
           "phone_number": "07507154077"
       }
   ]
    }
    """
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed without an address
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
           "address": "",
           "dob": "01/10/1976",
           "phone_number": "07502154062"
       }
    ]
    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

Scenario: Create a deed with single address but no postcode
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley",
           "dob": "11/01/2000",
           "phone_number": "07507154077"
       }
    ]
    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

Scenario: Create a deed with single address and non UK postcode
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley 12345",
           "dob": "11/01/2000",
           "phone_number": "07507154077"
       }
    ]
    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

Scenario: Create a deed with multiple UK mobile phone numbers
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
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "01/10/1976",
           "phone_number": "07507154072, 07528670998"
       }
    ]
    }
    """

    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['phone_number']:"

Scenario: Create a deed without a mobile phone number
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
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "01/10/1976",
           "phone_number": ""
       }
    ]
    }
    """
    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['phone_number']:"

Scenario: Create a deed where both borrowers have a unique mobile phone number
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Female",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "11/01/2000",
           "phone_number": "07507154077"
       },
       {
           "forename": "Paul",
           "middle_name": "",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "01/10/1976",
           "phone_number": "07502154062"
       }
    ]
    }
    """

    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed where both borrowers have the same mobile phone number
    Given I add the following deed:
    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Female",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "11/01/2015",
           "phone_number": "07507154076"
       },
       {
           "forename": "Paul",
           "middle_name": "",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "01/09/2015",
           "phone_number": "07507154076"
       }
    ]
    }
    """

    Then a status code of "400" is returned


Scenario: Create a deed without the DOB
    Given I add the following deed:
    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Female",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "",
           "phone_number": "07507154077"
       }
    ]
    }
    """

    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

Scenario: Create a deed with multiple DOBs for the same borrower
    Given I add the following deed:
    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Female",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "21/09/1965, 24/07/2000",
           "phone_number": "07507154077"
       }
    ]
    }
    """

    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

Scenario: Create a deed with an invalid DOB
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "F",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "21/09",
           "phone_number": "07507154077"
       }
    ]
    }
    """

    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"


Scenario: Create a deed with an invalid DOB date out of range
    Given I add the following deed:

    """
        {
        "title_number": "DT567568",
        "borrowers": [
           {
               "forename": "Katie",
               "middle_name": "Elizabeth",
               "surname": "Smythe",
               "gender": "F",
               "address": "1 The High Street Highley CR0 9YH",
               "dob": "32/09/1965",
               "phone_number": "07507154077"
           }
        ]
        }
        """

    Then a status code of "400" is returned
    And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

Scenario: Create a deed with one Male borrower and one female borrower
    Given I add the following deed:

    """
        {
        "title_number": "DT567568",
        "borrowers": [
           {
               "forename": "Katie",
               "middle_name": "Elizabeth",
               "surname": "Smythe",
               "gender": "Female",
               "address": "1 The High Street Highley CR0 9YH",
               "dob": "29/09/1965",
               "phone_number": "07507154087"
           },
           {
               "forename": "Paul",
               "middle_name": "",
               "surname": "Smythe",
               "gender": "Male",
               "address": "1 The High Street Highley PL6 7TG",
               "dob": "29/09/2000",
               "phone_number": "07507154076"
           }
        ]
        }
        """

    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed with one Male borrower and one Unknown borrower
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "Katie",
           "middle_name": "Elizabeth",
           "surname": "Smythe",
           "gender": "Not Specified",
           "address": "1 The High Street Highley CR0 9YH",
           "dob": "29/09/1965",
           "phone_number": "07507154077"
       },
       {
           "forename": "Paul",
           "middle_name": "",
           "surname": "Smythe",
           "gender": "Male",
           "address": "1 The High Street Highley PL6 7TG",
           "dob": "29/09/2000",
           "phone_number": "07507154076"
       }
    ]
    }
    """

    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed with one Male borrower and one invalid gender borrower
    Given I add the following deed:

    """
        {
        "title_number": "DT567568",
        "borrowers": [
           {
               "forename": "Katie",
               "middle_name": "Elizabeth",
               "surname": "Smythe",
               "gender": "MFU",
               "address": "1 The High Street Highley CR0 9YH",
               "dob": "29/09/1965",
               "phone_number": "07507154077"
           },
           {
               "forename": "Paul",
               "middle_name": "",
               "surname": "Smythe",
               "gender": "M",
               "address": "1 The High Street Highley PL6 7TG",
               "dob": "29/09/2000",
               "phone_number": "07507154076"
           }
        ]
        }
        """

        Then a status code of "400" is returned
        And a message for failure is given "Failed validating 'enum' in schema['properties']['borrowers']['items']['properties']['gender']:"

Scenario: Create a deed with one Female borrower and one borrower without gender
    Given I add the following deed:

    """
    {
    "title_number": "DT567568",
    "borrowers": [
       {
           "forename": "amanda",
           "middle_name": "",
           "surname": "Blah",
           "gender": "Female",
           "address": "5 high street DN55 1PT",
           "dob": "11/01/2010",
           "phone_number": "07383412346"
       },
       {
           "forename": "A",
           "middle_name": "b",
           "surname": "blah",
           "address": "blah blah blah PL9 8UG",
           "dob": "01/01/2015",
           "phone_number": "07300000009"
       }
    ]
    }
    """

    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

    Scenario: Create a deed with one borrower with a mobile number that is not UK format
        Given I add the following deed:

        """
            {
            "title_number": "DT567568",
            "borrowers": [
               {
                   "forename": "Katie",
                   "middle_name": "Elizabeth",
                   "surname": "Smythe",
                   "gender": "Not Specified",
                   "address": "1 The High Street Highley CR0 9YH",
                   "dob": "29/09/1965",
                   "phone_number": "12345123456"
               }
            ]
            }
            """

            Then a status code of "400" is returned
            And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['phone_number']:"
