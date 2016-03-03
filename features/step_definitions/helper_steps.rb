# This step def contains helper steps, created and used in Generic Refactor.

# Performs steps to view deed. See borrower_views_deed.rb
Then(/^the mortgage deed is displayed$/) do
  page.should have_content('Your mortgage deed')
  step %(the property address is formatted correctly)
  step %(the Title number is displayed)
  step %(the Lender is displayed on the deed)
  step %(the Charging clause is displayed on the deed)
  step %(the Additional provision is displayed on the deed)
  step %(the effective date element is present on page)
  step %(the Mortgage document reference is displayed)
end

Then(/^borrower <(\d+)> views the deed$/) do |borrower|
  # Use ONLY for the very first viewing of the deed
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
  step %(the mortgage deed is displayed)
end

# Used to hash the deed after a deed change has occured
Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end

# Performs deed setup Version 1.0
Given(/^I create default deed with <(\d+)> borrowers$/) do |borrower|
  # Creates a deed, with entered number of [borrowers].
  step %(I have valid deed data with <#{borrower}> borrowers)
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
end

# Use before any overrides
Given(/^I setup a deed with <(\d+)> borrowers$/) do |borrower|
  # Creates a deed, with entered number of [borrowers].
  step %(I have valid deed data with <#{borrower}> borrowers)
end

# Applies the deed override
# vr: deed variable to be changed. e.g dob
# vl: the new value the deed variable is to be set to. e.g '2/3/1980'
# b: borrower on the deed. e.g b = 1 is the first borrower
And(/^I amend "([^"]*)" to "([^"]*)"(?: for borrower <(\d+)>)?$/) do |vr, vl, b|
  b ||= 1
  case vr
  when 'title_number', 'md_ref', 'identity_checked', 'property_address' then
    @deed.instance_variable_set("@#{vr}", vl)
  else
    @deed.borrowers[b.to_i - 1][:"#{vr}"] = vl
  end
  step %(I hash the deed)
end

# Use after overrides have been applied, to create the modified deed
Then(/^I create the deed$/) do
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
end
