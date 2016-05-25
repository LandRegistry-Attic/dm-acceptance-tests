And(/^I get auth code for the borrower$/) do
  # Txtlocal has been removed from here

  @auth_code = 'DM1234'
end

When(/^I enter the wrong authentication code$/) do
  fill_in 'auth_code', with: '123456789'
  click_button('Confirm mortgage')
end
