And(/^I amend "([^"]*)" to "([^"]*)" for borrower <(\d+)>$/) do |var, val, opt|
  # Applies the deed override
  if var == 'title_number' || var == 'md_ref' || var == 'identity_checked'
    @deed.instance_variable_set("@#{var}", val)
  else
    @deed.borrowers[opt.to_i - 1][:"#{var}"] = val
  end
  step %(I hash the deed)
end

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

# Use after overrides have been applied, to create the modified deed
Then(/^I create the deed$/) do
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
end
