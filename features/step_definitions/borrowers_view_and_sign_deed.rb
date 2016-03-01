Then(/^borrower <(\d+)> views the deed$/) do |borrower|
  # Use ONLY for the very first viewing of the deed
  step %(I retrieve the unique user id for borrower <#{borrower}>)
  step %(I navigate to the borrower frontend "/borrower-reference" page)
  step %(I search for the deed using the unique borrower reference)
  step %(I enter the date of birth for borrower <#{borrower}>)
  step %(when I click on the "Continue" link)
  step %(the mortgage deed is displayed)
end

And(/^I retrieve the unique user id for borrower (?:<(\d+)>)?$/) do |borrower|
  # Retrieves ID for specific Borrower. OR first borrower by default
  borrower ||= 1
  @response = HTTP.get(Env.deed_api_buid_a + '/deed/' + @deed_id)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][borrower.to_i - 1]['token']
end

Given(/^the deed is digitally signed by borrower <(\d+)>$/) do |borrower|
  # Checks the mortgage deed is unsigned for borrower, then signs it.
  step %(the borrower <#{borrower}> signature element is present on page)
  step %(I confirm the mortgage deed)
  step %(a confirmation page is displayed)
end

Then(/^I verify borrower <(\d+)> has signed the deed$/) do |bor|
  # Use when viewing deed, to verify a previous signing has occurred
  f_name = @deed.borrowers[bor.to_i - 1][:forename]
  m_name = @deed.borrowers[bor.to_i - 1][:middle_name]
  s_name = @deed.borrowers[bor.to_i - 1][:surname]
  page.should have_content('Confirmed by '\
                           "#{f_name} #{m_name} #{s_name}")
end

Given(/^the borrower <(\d+)> signature element is present on page$/) do |bor|
  # Use when viewing deed, to verify specific Borrower has not signed
  f_name = @deed.borrowers[bor.to_i - 1][:forename]
  m_name = @deed.borrowers[bor.to_i - 1][:middle_name]
  s_name = @deed.borrowers[bor.to_i - 1][:surname]
  page.should have_content("[Awaiting confirmation from #{f_name}"\
                             "#{m_name} #{s_name}]")
end
