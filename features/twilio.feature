@twilio
Feature: Checko Twilio API

  @wip1233
  Scenario: Check Twilio integration
  And I get message list
  And I get latest message

  @wip1234
  Scenario: Set up deed with Twilio Phone Number
  Given I create default deed with <4> borrowers
  And borrower <1> views the deed
  Then the mortgage deed is displayed
