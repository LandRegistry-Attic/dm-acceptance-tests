@twilio
Feature: Checko Twilio API

  @wip1233 @viewdeed
  Scenario: Set up deed with Twilio Phone Number
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the mortgage deed is displayed
  And I get message list for borrower <1>
  Then the deed is digitally signed by borrower <1>

  @wip1234 @viewdeed
  Scenario: Set up deed with 2 borrowers
    Given I create default deed with <2> borrowers
    And borrower <1> views the deed
    And the mortgage deed is displayed
    And I get message list for borrower <1>
    Then the deed is digitally signed by borrower <1>
    And borrower <2> views the deed
    And the mortgage deed is displayed
    And I get message list for borrower <2>
    Then the deed is digitally signed by borrower <2>

  @wip1235
  Scenario: CHECK MESSAGE LIST
    Given I create default deed with <4> borrowers
    And I get message list for borrower <1>
    And I get message list for borrower <2>
    And I get message list for borrower <3>
    And I get message list for borrower <4>
