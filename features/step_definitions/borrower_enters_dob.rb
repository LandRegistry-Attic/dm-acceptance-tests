# Generic way to enter values into DOB field
When(/^I enter "([^"]*)" as the date of birth$/) do |dob|
split_dob = dob.split('/')
fill_in 'dob-day', with: split_dob[0]
fill_in 'dob-month', with: split_dob[1]
fill_in 'dob-year', with: split_dob[2]
click_button('Continue')
end

When(/^I enter the date of birth(?: for borrower <(\d+)>)?$/) do |borrower|
  # Extension of the Generic method. Enters DOB for specific Borrower
  # OR first borrower by default
  borrower ||= 1
  split_dob = @deed.borrowers[borrower.to_i - 1][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

When(/^I enter the borrowers date of birth$/) do
  split_dob = @deed.borrowers[0][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end
