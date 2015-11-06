Feature: Make sure everything works

Scenario: Visit a site and start clicking
  Given I visit the Site
  When I click the button
  Then I arrive at a page
