Feature: Make effective text contains organization name of Lender
As a conveyancer I want the effective text on the deed to contain my Lender name
So that it can be included on the mortgage deed

@us193a
Scenario: First Conveyancer Effective date and time text is displayed and includes Conveyancer name Land Registry Devices
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  Then the effective date element is present on page

@us193a
Scenario: Second Conveyancer Effective date and time text is displayed and includes Conveyancer name Land Registry Test
  Given Conveyancer two creates a deed with <1> borrowers
  And borrower <1> views conveyancer twos deed
  Then the effective date element for the second Lender is present on page
