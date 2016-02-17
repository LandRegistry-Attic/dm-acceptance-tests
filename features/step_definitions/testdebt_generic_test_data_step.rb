Then(/^I set deed "([^"]*)" to "([^"]*)"(?:,"([^"]*)")?$/) do |var, value, opt|
  # The value of bor is optional.
  # Sets bor = 1, if no bor parameter is passed in
  opt ||= 1
  case var
  when 'title_number'
    @deed.title_number = value
  when 'md_ref'
    @deed.md_ref = value
  when 'identity_checked'
    @deed.identity_checked = value
  when 'forename'
    @deed.borrowers[opt.to_i - 1][:forename] = value
  when 'surname'
    @deed.borrowers[opt.to_i - 1][:surname] = value
  when 'gender'
    @deed.borrowers[opt.to_i - 1][:gender] = value
  when 'address'
    @deed.borrowers[opt.to_i - 1][:address] = value
  when 'dob'
    @deed.borrowers[opt.to_i - 1][:dob] = value
  when 'phone_number'
    @deed.borrowers[opt.to_i - 1][:phone_number] = value
  when 'property_address'
    @deed.borrowers[opt.to_i - 1][:property_address] = value
  when 'middle_name'
    @deed.borrowers[opt.to_i - 1][:middle_name] = value
  else
    abort('Unrecognised Input, please recheck variable name, and value.')
  end
end

Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end
