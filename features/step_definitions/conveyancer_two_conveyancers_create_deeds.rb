Given(/^Conveyancer two creates a deed with <(\d+)> borrowers$/) do |borrower|
  step %(I have valid deed data with <#{borrower}> borrowers)
  step %(Conveyancer two creates the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
end

Then(/^borrower <(\d+)> views conveyancer twos deed$/) do |borrower|
  step %(I retrieve unique user id for deed created by conveyancer two)
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
  step %(the effective date element for the second Lender is present on page)
end
