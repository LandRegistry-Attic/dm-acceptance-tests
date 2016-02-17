@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt
Scenario: Override identity_checked variable
Given I have valid deed data with <2> borrowers
And I update deed variable "title_number" with value "009"
And I update deed variable "md_ref" with value "Tt109"
And I update deed variable "identity_checked" with value "Y"
And I update deed variable "forename" with value "Nick", borrower "2"
And I update deed variable "surname" with value "Valentine", borrower "2"
And I update deed variable "gender" with value "Male"
And I update deed variable "address" with value "34A Other Address, Actual Address"
And I update deed variable "dob" with value "01/02/1986"
And I update deed variable "phone_number" with value "12345678"
And I update deed variable "property_address" with value "123 Fake St, Fake Town"
And I update deed variable "middle_name" with value "Synth", borrower "2"
Then I hash the deed
And I update deed variable "forename" with value "Nany"
And I update deed variable "surname" with value "Geoff"
Then I hash the deed

@techdebt
Scenario: Override deed twice.
Given I have valid deed data with <1> borrowers
And I update deed variable "title_number" with value "009"
Then I hash the deed
And I update deed variable "title_number" with value "007"
Then I hash the deed
