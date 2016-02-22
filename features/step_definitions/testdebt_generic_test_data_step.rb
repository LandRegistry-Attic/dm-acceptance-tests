Then(/^I set deed "([^"]*)" to "([^"]*)"(?:,"([^"]*)")?$/) do |var, value, opt|
  # This will work for both steps below:
  # => And I set deed "middle_name" to "Synth","2"
  # and
  # => And I set deed "middle_name" to "Synth"
  # The value of opt is optional.

  # Sets opt = 1, if no bor parameter is passed in
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
  step %(I hash the deed)
end

Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end

Then(/^borrower <(\d+)> views the deed$/) do |borrower|
  # Use ONLY for the very first viewing of the deed
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I retrieve the deed id)
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
end

Then(/^borrower <(\d+)> views the deed again$/) do |borrower|
  # Use for every subsequent viewing of the deed, regardless of the borrower
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
end

And(/^I retrieve the unique user id for borrower <(\d+)>$/) do |borrower|
  @response = HTTP.get(Env.deed_api + @relative_get_path)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][borrower.to_i - 1]['token']
end

When(/^I enter the date of birth for borrower <(\d+)>$/) do |borrower|
  split_dob = @deed.borrowers[borrower.to_i - 1][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

Given(/^I create default deed with <(\d+)> borrowers(?:,"([^"]*)","([^"]*)","([^"]*)")?$/) do |borrower, var, val, opt|
  step %(I have valid deed data with <#{borrower}> borrowers)
  #Checks for optional deed params
  if var != nil
    if opt != nil
      require 'pry'
      binding.pry
      step %(I set deed "#{var}" to "#{val}","#{opt}")
    else
      step %(I set deed "#{var}" to "#{val}")
    end
  end

  step %(I create the deed via the Deed API)
end
