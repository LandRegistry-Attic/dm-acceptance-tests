@borrower_names

Feature: To validate the borrower names on the deed with those on the register

Acceptance Criteria

  (us42) Conveyancer must be alerted if more names are on the register than on the mortgage deed
  (us42) All names on the register must be on the mortgage deed
  (us42) There can be more names on the mortgage deed than on the register
  (us42) Conveyancer does not need to be alerted that there are more names on mortgage deed than register
  (us42) Names do not need to be in the same order that they are on the register
  (us42) Names must not be case sensitive
  (us42) Deed must be rejected if the names do not match

Scenario:
  Given I setup a deed with <1> borrowers
  #And I amend "title_number" to "GR515835"
  #And I create the deed via the Deed API
  #Then a status code of "201" is returned
