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
  @response = HTTP.get(@get_url)
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

Then(/^the deed is digitally signed$/) do
  step %(I confirm the mortgage deed)
  step %(a confirmation page is displayed)
end

Given(/^the deed is digitally signed by borrower <(\d+)>$/) do |borrower|
  step %(the mortgage deed is displayed)
  step %(I confirm the mortgage deed)
  step %(a confirmation page is displayed)
  # Create step to check borrowers name is not shown as an outstanding signature
  step %(borrower <#{borrower}> signature should not be outstanding)
end

Then(/^borrower <(\d+)> signature should not be outstanding$/) do |borrower|
  #This is just a place holder. Unsure of presentation
  page.should have_no_content('Borrowers yet to sign: ' + borrower)
end

Then(/^borrower <(\d+)> has signed the deed$/) do |bor|
  #Add this step with view deed after a signing has occurred
  f_name = @deed.borrowers[bor.to_i - 1][:forename]
  m_name = @deed.borrowers[bor.to_i - 1][:middle_name]
  s_name = @deed.borrowers[bor.to_i - 1][:surname]
  page.should have_content('Confirmed by '\
                           "#{f_name} #{m_name} #{s_name}")
end
