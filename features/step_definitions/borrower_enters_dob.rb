Given(/^I have deed data with a borrowers date of birth with leading zeros$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:dob] = '01/08/2015'
  @deed_hash = @deed.to_hash
end

When(/^I enter the borrowers date of birth$/) do
  split_dob = @deed.borrowers[0][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

When(/^I enter the date of birth for borrower <(\d+)>$/) do |borrower|
  split_dob = @deed.borrowers[borrower.to_i - 1][:dob].split('/')
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

When(/^I enter the borrowers date of birth without the leading zeros$/) do
  split_dob = @deed.borrowers[0][:dob].split('/')
  fill_in 'dob-day', with: "#{split_dob[0].to_i}"
  fill_in 'dob-month', with: "#{split_dob[1].to_i}"
  fill_in 'dob-year', with: "#{split_dob[2].to_i}"
  click_button('Continue')
end

When(/^I enter a date of birth that is in the future$/) do
  fill_in 'dob-day', with: (Date.today + 1).strftime('%d')
  fill_in 'dob-month', with: (Date.today + 1).strftime('%m')
  fill_in 'dob-year', with: (Date.today + 1).strftime('%Y')
  click_button('Continue')
end

When(/^I enter a date of birth that is not the borrowers$/) do
  incorrect_dob = Date.parse(@deed.borrowers[0][:dob]) - 1
  fill_in 'dob-day', with: incorrect_dob.strftime('%d')
  fill_in 'dob-month', with: incorrect_dob.strftime('%m')
  fill_in 'dob-year', with: incorrect_dob.strftime('%Y')
  click_button('Continue')
end
