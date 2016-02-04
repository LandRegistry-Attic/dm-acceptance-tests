@us152 @search_for_deed_via_title_number_and_md_ref
Feature: Search for deed via title number and MD Refs
In order to establish if a deed exists:
The deed store must be capable of being searched using title number and MD reference,
so that another service can be provided with the deed ID.

Acceptance Criteria
- A search of the deed store can be made using a combination of title number and MD reference
- If a single deed is found the service must return the deed ID and status of the deed
- If multiple deeds are found the service must return the deed ID and status of each deed
- The service must state when no deed exists

Scenario: A search of the deed store can be performed when using valid Title Number & MD Reference
Given I have valid deed data with <1> borrowers
And I create the deed via the Deed API
When I search the deed store
Then the text "token" is displayed on the page
And the text "status" is displayed on the page

Scenario: Multiple deed ID's and Status's are returned when searched using valid Title Number & MD Reference
Given I have valid deed data with <1> borrowers
And I create the deed via the Deed API
When I search the deed store with title_number <999>
Then the text "token" is displayed on the page
And the text "status" is displayed on the page
And the text "}, {" is displayed on the page

Scenario: Error is returned when search returns no deed
Given I have valid deed data with <1> borrowers
And I create the deed via the Deed API
When I search the deed store with title_number <99999999>
And the text "Not Found" is displayed on the page
