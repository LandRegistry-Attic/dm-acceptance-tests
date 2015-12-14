@us40 @add_md_ref
Feature: Coveyancer provides MD ref
  As a Conveyancer
  I want to provide an MD reference
  So that the correct Mortgage Deed can be created

Acceptance Criteria
  Only 1 MD ref can be supplied
  The format of the NEW MD ref is e-MD appended with 5 numerics, or, 3 or 4
  numbers appended with 1 Alpha valid numerics 1-9 Alphas A-Z

Scenario: Create a deed with two Mortgage Document references
  Given I have deed data with two md refs
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

  Scenario: Create a deed with an invalid mortgage document reference
  Given I have deed data with an md ref made of a six digit number
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['md_ref']:"

Scenario: Create a deed without a mortgage document reference
  Given I have deed data without an md ref
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "'md_ref' is a required property"
