@us65 @delete_borrower_personal_info

Feature: Delete borrower personal information once the deed has been submitted
  In order to ensure that Land Registry is not holding onto personal information
  Borrowers personal details must be deleted from Land Registry records once the
  mortgage application has been registered.

Background:
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API
  And I know the borrower id

Scenario: Delete Single Borrowers Details
  When I delete the borrowers personal information via the Deed API
  Then a status code of "200" is returned
  When I delete the borrowers personal information via the Deed API
  Then a status code of "404" is returned

Scenario: Delete Borrowers Details on an invalid Deed ID
  When I try to delete a borrowers details supplying an invalid Deed ID
  Then a status code of "404" is returned
