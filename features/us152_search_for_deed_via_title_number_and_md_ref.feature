@us152 @search_for_deed_via_title_number_and_md_ref
Feature: Search for deed via title number and MD Refs
In order to establish if a deed exists.
The deed store must be capable of being searched using title number and MD reference,
so that another service can be provided with the deed ID

Acceptance Criteria
A search of the deed store can be made using a combination of title number and MD reference
If a single deed is found the service must return the deed ID and status of the deed
If multiple deeds are found the service must return the deed ID and status of each deed
The service must state when no deed exists

Scenario:
