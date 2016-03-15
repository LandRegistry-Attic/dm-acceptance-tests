@twilio
Feature: Checko Twilio API

  @wip1233 @messagelist
  Scenario: Check Twilio integration
  And I get message list
  And I get latest message auth code

  @wip1234 @viewdeed
  Scenario: Set up deed with Twilio Phone Number
  Given I create default deed with <4> borrowers
  And borrower <1> views the deed
  Then the mortgage deed is displayed

  @wip1235 @sendsms
  Scenario: Send message to Twilio Phone Number
  Given I post SMS with body "Heya code is 12789"
