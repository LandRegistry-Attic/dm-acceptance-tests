@twilio
Feature: Checko twilio API

  Scenario: Check twilio integration
  Given I post SMS
  And I get message list
  And I get latest message