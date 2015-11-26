@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

  Background:
      Given I add the following deed:
      """
      {
        "title_number": "DT567568",
        "borrowers": [
          {
               "forename": "Paul",
               "middle_name": "",
               "surname": "Smythe",
               "gender": "Male",
               "address": "2 The Street, Plymouth, PL1 2PP",
               "dob": "01/10/1976",
               "phone_number": "07502154062"
           },
           {
                "forename": "Jane",
                "middle_name": "Seymour",
                "surname": "Smythe",
                "gender": "Female",
                "address": "2 The Street, Plymouth, PL1 2PP",
                "dob": "01/12/1982",
                "phone_number": "07502154999"
            }
        ]
      }
      """


  Scenario: Borrower enters a valid deed reference

            Deed must display:
             - Borrowers
             - Title number

      Given I navigate to the borrower frontend "/searchdeed" page
      When I search for the created deed
      Then the "Your mortgage deed" page is displayed

  Scenario: Borrower enters invalid deed reference

      - information message displayed when incorrect id entered

      Given I navigate to the borrower frontend "/searchdeed" page
      When I search for an invalid deed
      Then the "Deed was not found for:" page is displayed
