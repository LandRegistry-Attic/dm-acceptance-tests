@us40 @add_md_ref
Feature: Coveyancer provides MD ref
  As a Conveyancer
  I want to provide an MD reference
  So that the correct Mortgage Deed can be created

Acceptance Criteria
  Only 1 MD ref can be supplied
  The format of the NEW MD ref is e-MD appended with 5 numerics, or, 3 or 4
  numbers appended with 1 Alpha valid numerics 1-9 Alphas A-Z

@us40
Scenario: Create a deed with two Mortgage Document references
  Given I setup a deed with <1> borrowers
  And I amend "md_ref" to "e-MD12345, e-MD1234Z" for borrower <1>
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

@us40
Scenario: Create a deed with an invalid mortgage document reference
  Given I setup a deed with <1> borrowers
  And I amend "md_ref" to "e-MD123456" for borrower <1>
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

@us40
Scenario: Create a deed without a mortgage document reference
  Given I have deed data without an md ref
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "'md_ref' is a required property"

@us119
Scenario: Create a deed without a mortgage document reference
  Given I have deed data where md ref is not on the mortgage document table
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "mortgage document associated with supplied md_ref is not found"
