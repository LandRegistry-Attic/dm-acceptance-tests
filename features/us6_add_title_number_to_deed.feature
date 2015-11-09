Feature: Add Title Number to Deed
    As a Conveyancer I need to provide the Title Number
    So that the it can be added to the mortgage deed

Acceptance Criteria
    BRL-DM-1 Only 1 title number can be provided
    BRL-DM-2 Title number must be in title number format.
    Response code returned for successful and unsuccessful request
    A link to the resource must be returned as part of the response

Scenario:   Add Valid Title Number
    Given I have a valid title number
    When I send a valid title number
    Then a status code of "200" is returned
    Then a url link to retrieve the title number is returned

Scenario:   Add Multiple Title Numbers
    Given I have a valid title number
    When I send two title numbers
    Then a status code of "400" is returned

Scenario:   Add Invalid Title Number
    Given I have an invalid title number
    When I send an invalid title number
    Then a status code of "400" is returned
