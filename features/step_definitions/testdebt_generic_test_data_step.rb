Then(/^I override deed with "([^"]*)"$/) do |params|
  # This will work for both steps below:
  # => And I override deed with "middle_name:Synth:2"
  # and
  # => And I override deed with "middle_name:Synth"
  # The 3rd value is optional.

  # Sets opt = 1, if no bor parameter is passed in
  opt ||= 1
  # Splits the params string
  split_params = params.split(':')
  var = split_params[0]
  value = split_params[1]

  # Checks if Borrower number was passed in
  if split_params[2] != nil
    opt = split_params[2]
  end

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
  step %(I hash the deed)
end

Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end

Given(/^I create default deed with <(\d+)> borrowers(?:,"([^"]*)")?$/) do |borrower, params|
  # Creates a deed, with entered number of [borrowers].
  # Uses [params] to apply any ovverides to the deed. e.g Change the name of a borrower
  step %(I have valid deed data with <#{borrower}> borrowers)
  #Checks for optional deed params
  if params != nil
      step %(I override deed with "#{params}")
  end
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  require 'pry'
  binding.pry
end
