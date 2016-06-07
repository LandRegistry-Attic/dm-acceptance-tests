@us13 @borrowers_personal_info
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

@us13
Scenario: Create a deed without an address
  Given I setup a deed with <1> borrowers
  And I amend "address" to "" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

@us13
Scenario: Create a deed with single address but no postcode
  Given I setup a deed with <1> borrowers
  And I amend "address" to "1 The High Street Highley" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

@us13
Scenario: Create a deed with single address and non UK postcode
  Given I setup a deed with <1> borrowers
  And I amend "address" to "8 Rue de Champignon 75008 Paris" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['address']:"

@us13
Scenario: Create a deed with multiple UK mobile phone numbers
  Given I setup a deed with <1> borrowers
  And I amend "phone_number" to "07507154072, 07528670998" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['phone_number']:"

@us13
Scenario: Create a deed without a mobile phone number
  Given I setup a deed with <1> borrowers
  And I amend "phone_number" to "" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['phone_number']:"

@us13
Scenario: Create a deed where both borrowers have the same mobile phone number
  Given I setup a deed with <2> borrowers
  And I amend "title_number" to "CYM123458"
  And I amend "phone_number" to "07507154077" for borrower <1>
  And I amend "phone_number" to "07507154077" for borrower <2>
  When I create the deed via the Deed API
  Then a status code of "400" is returned

@us13
Scenario: Create a deed without the DOB
  Given I setup a deed with <1> borrowers
  And I amend "dob" to "" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

@us13
Scenario: Create a deed with multiple DOBs for the same borrower
  Given I setup a deed with <1> borrowers
  And I amend "dob" to "21/09/1965, 24/07/2000" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

@us13
Scenario: Create a deed with an invalid DOB
  Given I setup a deed with <1> borrowers
  And I amend "dob" to "1965/09/21" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

@us13
Scenario: Create a deed with an invalid DOB date out of range
  Given I setup a deed with <1> borrowers
  And I amend "dob" to "32/09/1965" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['borrowers']['items']['properties']['dob']:"

@us13
Scenario: Create a deed with one Male borrower and one invalid gender borrower
  Given I setup a deed with <2> borrowers
  And I amend "gender" to "Troll" for borrower <1>
  And I amend "gender" to "male" for borrower <2>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'enum' in schema['properties']['borrowers']['items']['properties']['gender']:"

@us13
Scenario: Create a deed with one Female borrower and one borrower without gender
  Given I have deed data with two borrowers one which has no gender
  When I create the deed via the Deed API
  Then a status code of "201" is returned
  And a url link to retrieve the deed is returned
