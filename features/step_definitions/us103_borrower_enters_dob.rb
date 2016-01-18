When(/^I enter the borrowers date of birth$/) do
  split_dob = @deed.borrowers[0][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

When(/^I enter an incorrect date of birth$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I enter a date of birth that is in the future$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I enter a date of birth that is not in a uk date format$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the error "([^"]*)" should be displayed$/) do |error_message|
  pending # Write code here that turns the phrase above into concrete actions
end
