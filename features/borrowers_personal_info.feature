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
  BRL - DM-05 Each mobile phone number must be unique to the individual borrower within a single transaction.
  BRL-DM-06 - A borrowers date of birth cannot be a future date
  BRL-DM-07 The format of a date of birth must be DD/MM/YYYY and it must be a valid date.
  BRL-DM-08 Address is free format and must contain a UK postcode
  BRL-DM-09  Mobile phone number must  be in the  UK format
  BRL-DM-10 Gender will be M, F or U

Scenario: Create a deed with borrowers personal details
    Given I create a Deed with the following data:

      | GENDER   | ADDRESS                               | DOB          | PHONE NUMBER  |
      | M        | 1 High Street Plymouth PL7 6TG        | 11/01/1987   | 07528670998   |

    When I submit a deed using Deed API
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned
    And check those details are recorded correctly

Scenario: Create a deed with multiple UK addresses
    Given I have multiple UK addresses for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed without an address
    Given I do not have an address for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with single address but no postcode
    Given I have a single address without a postcode for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with single address and non UK postcode
    Given I have a single address with a postcode that is non UK for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with multiple UK mobile phone numbers
    Given I have multiple UK mobile phone numbers for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed without a mobile phone number
    Given I do not have a mobile phone number for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed where both borrowers have a unique mobile phone number
    Given I have 2 borrowers with unique mobile phone numbers
    When I submit a deed using Deed API
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed where both borrowers have the same mobile phone number
    Given I have the same mobile phone number for both borrowers
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed without the DOB
    Given I do not have the DOB for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with multiple DOBs for the same borrower
    Given I have two DOBs for the same borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with an invalid DOB
    Given I do have an invalid future DOB for the borrower
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with an invalid DOB - date out of range
    Given I have an invalid DOB for the borrower of "32/01/1993"
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with one Male borrower and one female borrower
    Given I have two borrowers where one is "M" and one "F"
    When I submit a deed using Deed API
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed with one Male borrower and one Unknown borrower
    Given I have two borrowers where one is "M" and one is "U"
    When I submit a deed using Deed API
    Then a status code of "201" is returned
    And a url link to retrieve the deed is returned

Scenario: Create a deed with one Male borrower and one invalid gender borrower
    Given I have two borrowers where one is "M" and one is "Female"
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned

Scenario: Create a deed with one Female borrower and one borrower without gender
    Given I have two borrowers where one is "M" and one is not provided
    When I submit a deed using Deed API
    Then a status code of "400 with an error message" is returned
