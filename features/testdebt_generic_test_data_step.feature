@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt
Scenario: Override identity_checked variable
Given I have valid deed data with <2> borrowers
And I set deed "title_number" to "009"
And I set deed "md_ref" to "Tt109"
And I set deed "identity_checked" to "Y"
And I set deed "forename" to "Nick","2"
And I set deed "surname" to "Valentine","2"
And I set deed "gender" to "Male"
And I set deed "address" to "34A Other Address, Actual Address"
And I set deed "dob" to "01/02/1986"
And I set deed "phone_number" to "12345678"
And I set deed "property_address" to "123 Fake St, Fake Town"
And I set deed "middle_name" to "Synth","2"
Then I hash the deed
And I set deed "forename" to "Nany"
And I set deed "surname" to "Geoff"
And I set deed "middle_name" to "Maddy"
Then I hash the deed

@techdebt
Scenario: Override deed twice.
Given I have valid deed data with <1> borrowers
And I set deed "title_number" to "009"
Then I hash the deed
And I set deed "title_number" to "007"
Then I hash the deed

@techdebt2
Scenario: WIP for checking signature
Given I create default deed with <2> borrowers
And borrower <2> views the deed
And borrower <1> views the deed again
