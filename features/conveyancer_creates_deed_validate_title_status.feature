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
         Relating Franchise
         Profit of prendre in gross
         Qualified
         Scheme
         Caution
         Developer
         Rentcharge
         Commonhold

Scenario: Create Deed against an Absolute Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR515835"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Franchise title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR519209"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Franchise Title"

Scenario: Create Deed against a relating Franchise title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR519208"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a relating Franchise Title"

Scenario: Create Deed against a Profit of prendre in gross title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR528321"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Profit of prendre in gross Title"

Scenario: Create Deed against a Possessory Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR517730"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Qualified Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "BK265471"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Qualified Title"

Scenario: Create Deed against a Scheme Title Freehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "DT12345"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Scheme Title"

Scenario: Create Deed against a Absolute Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR314108"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Good Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR517788"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Qualified Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR516921"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Qualified Title"

Scenario: Create Deed against a Qualified Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "AV211374"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Qualified Title"

Scenario: Create Deed against a Possessory Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "AV182773"
  And I create the deed via the Deed API
  Then a status code of "201" is returned

Scenario: Create Deed against a Absolute Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "AV29204"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Rentcharge Title"

Scenario: Create Deed against a Possessory Rentcharge title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "CH163582"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Rentcharge Title"

Scenario: Create Deed against a Caution title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "BK308598"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Caution Title"

Scenario: Create Deed against a Closed title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR518039"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title Closed"

Scenario: Create Deed against a Closed and Continued title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR518327"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title Closed and Continued under GR518006"

Scenario: Create Deed against a title number that is valid format but does not exist
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR999999"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title does not exist"

Scenario: Create Deed against a Scheme Leasehold title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "BK257662"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Scheme Title"

Scenario: Create Deed against a developer title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "GR146463"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Developer Title"

Scenario: I Create Deed against a blank title number
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to ""
  And I create the deed via the Deed API
  Then a status code of "400" is returned

Scenario: Create Deed against a title number that has common parts in the title
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "DT58118"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Commonhold title"

Scenario: Create Deed against a title number that has common units in the title
  Given I setup a deed with <1> borrowers
  And I amend "title_number" to "CYM497"
  And I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Title is not suitable for a Digital Mortgage as it is a Commonhold title"
