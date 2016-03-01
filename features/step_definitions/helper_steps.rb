# This step def contains helper steps, created and used in Generic Refactor.

Then(/^borrower <(\d+)> views the deed$/) do |borrower|
  # Use ONLY for the very first viewing of the deed
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
  step %(the mortgage deed is displayed)
end

# Retrieves ID for specific Borrower. OR first borrower by default
And(/^I retrieve the unique user id for borrower (?:<(\d+)>)?$/) do |borrower|
  borrower ||= 1
  @response = HTTP.get(Env.deed_api_buid_a + '/deed/' + @deed_id)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][borrower.to_i - 1]['token']
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
And(/^I amend "([^"]*)" to "([^"]*)"(?: for borrower <(\d+)>)?$/) do |var, val, opt|
  case var
  when 'title_number', 'md_ref', 'identity_checked', 'property_address' then
    @deed.instance_variable_set("@#{var}", val)
  else
    @deed.borrowers[opt.to_i - 1][:"#{var}"] = val
  end
  step %(I hash the deed)
end

# Use after overrides have been applied, to create the modified deed
Then(/^I create the deed$/) do
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
end
