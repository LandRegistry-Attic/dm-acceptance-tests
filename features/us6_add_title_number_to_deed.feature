Feature: Add Title Number to Deed
    As a Conveyancer I need to provide the Title Number
    So that the it can be added to the mortgage deed

Acceptance Criteria
    BRL-DM-1 Only 1 title number can be provided
    BRL-DM-2 Title number must be in title number format.
    Response code returned for successful and unsuccessful request
    A link to the resource must be returned as part of the response

Scenario: Add Multiple Title Numbers
    Given I have a deed with two title numbers
    When I create a deed using Deed API
    Then a status code of "400" is returned

Scenario: Add Invalid Title Number
    Given I have a deed with an invalid title number
    When I create a deed using Deed API
    Then a status code of "400" is returned
