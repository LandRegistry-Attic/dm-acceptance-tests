@title_status

Feature: To validate the class of title and title status to ensure the electronic
mortgage is created against a suitable title number.

Acceptance Criteria

    -Title number must exist on LR system
    -Must return the continuation Title Number where Title is Closed and Continued
    -Deed cannot be created and an Informative message must be returned if title is:
         Closed
         Closed and continued
         Title Number does not exist
         Franchise
         Commonhold
         Profit of prendre in gross
         Qualified
         Scheme
         Caution
         Developer
         Rentcharge

Scenario: Create Deed against an Absolute Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR515835"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Franchise title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API
  #Then a status code of "201" is returned
  #And a message "not suitable" is returned

Scenario: Create Deed against a Possessory Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API


Scenario: Create Deed against a Qualified Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Scheme Title Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Absolute Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Good Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Qualified Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Qualified Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Possessory Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Scheme Title Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Absolute Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Possessory Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Caution title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Closed title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Closed and Continued title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a title number that is valid format but does not exist
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Scheme Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a Scheme Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API

Scenario: Create Deed against a developer title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API
