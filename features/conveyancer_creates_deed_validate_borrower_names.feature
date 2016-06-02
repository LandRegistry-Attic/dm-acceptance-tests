@borrower_names

Feature: To validate the borrower names on the deed with those on the register

Acceptance Criteria

  (us42) 1. Conveyancer must be alerted if more names are on the register than on the mortgage deed
  (us42) 2. All names on the register must be on the mortgage deed
  (us42) 3. There can be more names on the mortgage deed than on the register
  (us42) 4. Conveyancer does not need to be alerted that there are more names on mortgage deed than register
  (us42) 5. Names do not need to be in the same order that they are on the register
  (us42) 6. Names must not be case sensitive
  (us42) 7. Deed must be rejected if the names do not match

Scenario: Name on deed is on register but more names on register than are on the deed. Deed is not created.
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR314108"
  And I amend "forename" to "Ann"
  And I amend "surname" to "Smith"
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "a digital mortgage cannot be created as there is a discrepancy between the names given and those held on the register."

Scenario: Name on deed is on register, single name on register and deed. Deed is created.
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR515835"
  And I amend "forename" to "Ann"
  And I amend "surname" to "Smith"
  When I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Names on deed appear on register, two names on register and three on deed, deed names are mixed case. Deed is created.
  Given I setup a deed with <3> borrowers
  And I amend "title_number" to "GR517788"
  And I amend "forename" to "Ann" for borrower <1>
  And I amend "middle_name" to "Marie-JONES" for borrower <1>
  And I amend "surname" to "SMITH" for borrower <1>
  And I amend "forename" to "Belinda" for borrower <2>
  And I amend "surname" to "Blue" for borrower <2>
  And I amend "forename" to "Charles John" for borrower <3>
  And I amend "middle_name" to "Morris" for borrower <3>
  And I amend "surname" to "SMITH Jones" for borrower <3>
  When I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Name on deed is on register but more names on register than are on the deed. Deed is not created as more names on register than deed.
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "AV182773"
  And I amend "forename" to "Lisa"
  And I amend "surname" to "I'anson"
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "a digital mortgage cannot be created as there is a discrepancy between the names given and those held on the register."

Scenario: Name on deed includes special characters, deed is not created as names do not match exactly.
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR517730"
  And I amend "forename" to "Liam"
  And I amend "surname" to "Trémoïlle"
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "a digital mortgage cannot be created as there is a discrepancy between the names given and those held on the register."
