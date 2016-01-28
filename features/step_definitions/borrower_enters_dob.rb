When(/^I enter the borrowers date of birth$/) do
  split_dob = @deed.borrowers[0][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

When(/^I enter a date of birth that is not in a uk date format$/) do
  fill_in 'dob-day', with: '09'
  fill_in 'dob-month', with: '30'
  fill_in 'dob-year', with: '2015'
  click_button('Continue')
end

Then(/^the error "([^"]*)" should be displayed$/) do |error_message|
  page.should have_content(error_message)
end
