@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt @techdebt1
Scenario: WIP for default deed
Given I create default deed with <2> borrowers
And borrower <2> views the deed
And borrower <1> views the deed

# version 1.0
# Readable way to override deed info
@techdebt @techdebt2
Scenario: WIP for override
Given I create default deed with <2> borrowers
Then set "forename" to "Tinny" for borrower <1>
Then set "dob" to "22/2/1982" for borrower <2>
And I hash the deed
