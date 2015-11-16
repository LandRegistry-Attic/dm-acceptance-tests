Feature: Check Business Processes

This feature is a container for the more generic acceptance tests that cover
the main business processes of the digital mortgage service.

Scenario: Create Deed with Valid Data
    Given I have a valid deed
    When I create a deed using Deed API
    Then a status code of "201" is returned
    And a url link to retrieve the title number is returned
