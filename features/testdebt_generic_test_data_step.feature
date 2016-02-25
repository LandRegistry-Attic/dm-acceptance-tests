@deed_overrides @wip
Feature: Override deed variables

Acceptance Criteria
- Can override ALL deed variables from one step

@techdebt @techdebt1
Scenario: WIP for default deed
Given I create default deed with <2> borrowers
And borrower <2> views the deed
And borrower <1> views the deed

@techdebt @techdebt2
Scenario: WIP for override
Given I create default deed with <2> borrowers
And I override deed with "forename:TIMMY:2"
And I override deed with "middle_name:TIMMY:2"
And I override deed with "surname:TIMMY:2"
And I hash the deed

@techdebt @techdebt3
Scenario:  WIP create deed with override
Given I create default deed with <3> borrowers,"forename:TIMMY:2"
And borrower <2> views the deed
And borrower <1> views the deed
