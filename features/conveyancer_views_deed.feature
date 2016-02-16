Feature: Conveyancer can login via webseal to view their own deed
  As a Conveyancer I want to search for mortgage deeds created by my
  business unit
  So that I can view them

Acceptance criteria
  (us146b) Conveyencer should only be able to get info on THEIR deed
  applications (at Business Unit ID (BUID) level)

@us146b
Scenario: Conveyancer views a deed created by their own Business Unit
  Given I have created a deed
  When I search for the deed
  Then a status code of "201" is returned

@us146b
Scenario: Conveyancer is not able to view a deed created by a different
Business Unit
  Given a different Business Unit has created a deed
  When I search for the deed
  Then a status code of "400" is returned
  And a message for failure is given "????????????"
