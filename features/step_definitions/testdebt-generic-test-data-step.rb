#When (/^I check the favorite color count(?: for email address (.*))?$/) do |email|
Then(/^I update deed variable "([^"]*)" with value "([^"]*)"(?:, borrower "([^"]*)")?$/) do |var, value, bor|
  #Take in array of params. Perform on all lines
  opt ||= 1 # This value is global in the test, i.e get updated between steps
  case var
  when 'title_number'
    @deed.title_number = value
  when 'md_ref'
    @deed.md_ref = value
  when 'identity_checked'
    @deed.identity_checked = value
  when 'forename'
    @deed.borrowers[bor.to_i - 1][:forename] = value
  when 'surname'
    @deed.borrowers[bor.to_i - 1][:surname] = value
  when 'gender'
    @deed.borrowers[bor.to_i - 1][:gender] = value
  when 'address'
    @deed.borrowers[bor.to_i - 1][:address] = value
  when 'dob'
    @deed.borrowers[bor.to_i - 1][:dob] = value
  when 'phone_number'
    @deed.borrowers[bor.to_i - 1][:phone_number] = value
  when 'property_address'
    @deed.borrowers[bor.to_i - 1][:property_address] = value
  when 'middle_name'
    @deed.borrowers[bor.to_i - 1][:middle_name] = value
  else
    abort('Unrecognised Input, please recheck variable name, and value.')
  end
  opt = 1 #resetting default value
end

Then(/^I hash the deed$/) do
  require 'pry'
  binding.pry
  @deed_hash = @deed.to_hash
end
