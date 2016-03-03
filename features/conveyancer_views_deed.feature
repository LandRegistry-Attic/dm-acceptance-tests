Feature: Conveyancer can login via webseal to view their own deed
  As a Conveyancer I want to search for mortgage deeds created by my
  business unit
  So that I can view them

Acceptance criteria
  (us146b) Conveyencer should only be able to get info on THEIR deed
  applications (at Business Unit ID (BUID) level)

@us146b
Scenario: Conveyancer views a deed created by their own Business Unit
  Given I create default deed with <1> borrowers
  When I retrieve the deed using the same business unit id
  Then a status code of "200" is returned

@us146b
Scenario: Conveyancer is not able to view a deed created by a different
Business Unit
  Given I create default deed with <1> borrowers
  When I retrieve the deed using a different business unit id
  Then a status code of "404" is returned
