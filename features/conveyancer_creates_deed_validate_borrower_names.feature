@borrower_names

Feature: To validate the borrower names on the deed with those on the register

Acceptance Criteria

  (us42) AC1. Conveyancer must be alerted if more names are on the register than on the mortgage deed
  (us42) AC2. All names on the register must be on the mortgage deed
  (us42) AC3. There can be more names on the mortgage deed than on the register
  (us42) AC4. Conveyancer does not need to be alerted that there are more names on mortgage deed than register
  (us42) AC5. Names do not need to be in the same order that they are on the register
  (us42) AC6. Names must not be case sensitive
  (us42) AC7. Deed must be rejected if the names do not match


#AC1 #AC2 #AC7
Scenario: Name on deed is on register but more names on register than are on the deed.
Deed is not created as more names on register than deed.
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "CYM123456"
  And I amend "forename" to "Ann" for borrower <1>
  And I amend "surname" to "Smith" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "a digital mortgage cannot be created as there is a discrepancy between the names given and those held on the register."


Scenario: Name on deed is on register, single name on register and two names on deed.
Deed is created as name on register matches one of names on deed.

  Given I have deed data with 1 proprietor with forename and surname matching the deed
  When I create the deed via the Deed API
  Then a status code of "201" is returned


#AC3 #AC4 #AC5 #AC6 #AC7 @us5
Scenario: Names on deed appear on register, two names on register and three on deed,
deed names are mixed case. Deed is created as the two names on register match two of
the names on the deed.

  Given I setup a deed with <3> borrowers
  And I amend "title_number" to "CYM123458"
  And I amend "forename" to "Belinda" for borrower <1>
  And I amend "surname" to "Blue" for borrower <1>
  And I amend "forename" to "Ann" for borrower <2>
  And I amend "middle_name" to "Marie-JONES" for borrower <2>
  And I amend "surname" to "SMITH" for borrower <2>
  And I amend "forename" to "Charles John" for borrower <3>
  And I amend "middle_name" to "Morris" for borrower <3>
  And I amend "surname" to "SMITH Jones" for borrower <3>
  When I create the deed via the Deed API
  Then a status code of "201" is returned
