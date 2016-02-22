@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt @techdebt1
Scenario: WIP for default deed
Given I create default deed with <2> borrowers
And borrower <2> views the deed
And borrower <1> views the deed again

@techdebt @techdebt2
Scenario: WIP for override
Given I create default deed with <2> borrowers
And I override deed "forename:TIMMY:2"

@techdebt @techdebt3
Scenario:  WIP create deed with override
Given I create default deed with <3> borrowers,"forename:TIMMY:2"
And borrower <2> views the deed
And borrower <1> views the deed again

@techdebt @techdebt4
Scenario:  WIP for override no opt
Given I create default deed with <2> borrowers,"forename:TIMMY"
And borrower <2> views the deed
And borrower <1> views the deed again
