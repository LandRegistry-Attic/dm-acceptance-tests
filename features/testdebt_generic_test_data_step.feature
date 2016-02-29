@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt @techdebt1
Scenario: WIP for default deed
Given I create default deed with <2> borrowers
And borrower <2> views the deed
And borrower <1> views the deed

# version 1.6
# Readable way to override deed info
@techdebt @techdebt2
Scenario: WIP for override
Given I setup deed with <1> borrowers
Then set "forename" to "Timmy" for borrower <1>
And I create the deed
And borrower <1> views the deed
And the borrower <1> signature element is present on page
Then the deed is digitally signed by borrower <1>

# Sets up a 1 borower deed, with the single override applied 
@techdebt @techdebt3
Scenario: WIP for override 2
Given deed data with "Joe" as "forename"
And borrower <1> views the deed
And the borrower <1> signature element is present on page
Then the deed is digitally signed by borrower <1>
