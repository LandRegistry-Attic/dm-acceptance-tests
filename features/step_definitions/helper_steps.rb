# This step def contains helper steps, created and used in Generic Refactor.

# Confirms the content of the Deed page
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

# Performs steps to view deed. See borrower_views_deed.rb
Then(/^borrower <(\d+)> views the deed$/) do |borrower|
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(I check the contents of how to proceed page)
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

# Checks the mortgage deed is unsigned for borrower, then signs it.
Given(/^the deed is digitally signed by borrower <(\d+)>$/) do |borrower|
  step %(the borrower <#{borrower}> signature element is present on page)

  # Conditional check to see if authentication code is to be sent or not
  if step %(the text "Receiving your authentication code" is displayed on the page)
    step %(I request an authentication code for borrower <#{borrower}>)
    step %(I enter an authentication code)
  else
    click_button('Continue')
  end
  step %(a confirmation page is displayed)
end

Given(/^I check the contents of how to proceed page$/) do
  page.should have_content('View your mortgage deed')
  page.should have_content('signed in you can view an'\
  ' online version of your mortgage deed. You should:')

  page.should have_content('Read your mortgage deed carefully')
  page.should have_content('Compare the online version of the deed with the'\
  ' paper version you have received from your conveyancer. If you spot'\
  ' any mistakes you should let your conveyancer know.')

  page.should have_content('Confirm your mortgage deed is correct')
  page.should have_content('If you are happy there are no mistakes, then you'\
  ' will need to request an authentication code to be sent to your mobile'\
  ' phone in order to confirm the deed is correct.')

  page.should have_content('Sign your paper mortgage deed')
  page.should have_content('The online deed is not the legal mortgage. You'\
  ' should still sign and return your paper mortgage deed following the'\
  ' instructions you have from your conveyancer.')
end
