@twilio
Feature: Checko Twilio API

  @wip1233
  Scenario: Check Twilio integration
  And I get message list
  And I get latest message

  @wip1234
  Scenario: Set up deed with Twilio Phone Number
  Given I setup a deed with <1> borrowers
  And I amend "phone_number" to "07481362536" for borrower <1>
  And I create the deed
  And borrower <1> views the deed
  Then the mortgage deed is displayed
  Then the deed is digitally signed by borrower <1>
  And borrower <1> views the deed
  Then I verify borrower <1> has signed the deed
