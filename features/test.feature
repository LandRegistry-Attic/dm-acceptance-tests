@test_sms

Feature: Test the sms

Scenario: Single borrower views and signs deed, then views
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the borrower <1> signature element is present on page
  Then the deed is digitally signed by borrower <1>
  And borrower <1> views the deed
  And the mortgage deed is displayed
  Then I verify borrower <1> has signed the deed