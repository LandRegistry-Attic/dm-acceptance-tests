Then(/^I update deed variable "([^"]*)" with value "([^"]*)"$/) do |var, value|
  #Take in array of params. Perform on all lines
  case var
  when 'title_number'
    @deed.title_number = value
  when 'md_ref'
    @deed.md_ref = value
  when 'identity_checked'
    @deed.identity_checked = value
  when 'forename'
    @deed.borrowers[0][:forename] = value
  when 'surname'
    @deed.borrowers[0][:surname] = value
  when 'gender'
    @deed.borrowers[0][:gender] = value
  when 'address'
    @deed.borrowers[0][:address] = value
  when 'dob'
    @deed.borrowers[0][:dob] = value
  when 'phone_number'
    @deed.borrowers[0][:phone_number] = value
  when 'property_address'
    @deed.borrowers[0][:property_address] = value
  when 'middle_name'
    @deed.borrowers[0][:middle_name] = value
  else
    abort('Unrecognised Input, please recheck variable name, and value.')
  end
end

Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end
