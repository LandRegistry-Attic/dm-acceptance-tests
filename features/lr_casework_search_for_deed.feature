@casework_search_for_deed
Feature: Search for deed via title number and MD Refs
In order to establish if a deed exists:
The deed store must be capable of being searched using title number and MD reference,
so that another service can be provided with the Deed ID and status.


Acceptance Criteria
- (us152) A search of the deed store can be made using a combination of title number and MD reference
- (us152) If a single deed is found the service must return the deed ID and status of the deed
- (us152) If multiple deeds are found the service must return the deed ID and status of each deed
- (us152) The service must state when no deed exists

@us152
Scenario: A search of the deed store can be performed when using valid Title Number & MD Reference

Given I setup a deed with <1> borrowers
And I amend "title_number" to "9079"
And I create the deed via the Deed API
When I search the deed store with title_number "9079"
Then I verify the returned deed information


@us152
Scenario: Multiple deed ID's and Statuses are returned when searched using valid Title Number & MD Reference
Given I setup a deed with <1> borrowers
And I amend "title_number" to "DM11"
And I create the deed via the Deed API
And I setup a deed with <1> borrowers
And I amend "title_number" to "DM11"
And I create the deed via the Deed API
When I search the deed store with title_number "DM11"
Then I verify the returned deed information


@us152
Scenario: Error is returned when search returns no deed
Given I setup a deed with <1> borrowers
And I amend "title_number" to "DM11"
And I create the deed via the Deed API
When I search the deed store with title_number "99999"
Then a status code of "404" is returned

@us133f @wip12
Scenario: Verify deed status is Complete when fully signed
Given I setup a deed with <1> borrowers
And I amend "title_number" to "99999"
When I create the deed
Given I create default deed with <1> borrowers
And borrower <1> views the deed
And the borrower <1> signature element is present on page
Then the deed is digitally signed by borrower <1>
When I search the deed store with title_number "99999"
Then I verify the returned deed information is "Complete"

@us133f @wip12
Scenario: Verify deed status is Incomplete when not fully signed
Given I setup a deed with <2> borrowers
And I amend "title_number" to "6789"
When I create the deed
Given I create default deed with <1> borrowers
And borrower <1> views the deed
And the borrower <1> signature element is present on page
Then the deed is digitally signed by borrower <1>
When I search the deed store with title_number "6789"
Then I verify the returned deed information is "Incomplete"
