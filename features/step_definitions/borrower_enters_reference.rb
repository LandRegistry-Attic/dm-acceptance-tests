# Searches for deed with @borrower_token
And(/^I search for the deed using the unique borrower reference$/) do
  fill_in 'borrower_token', with: @borrower_token
  click_button('Continue')
end

# Clicks continue button, on borrower reference page
When(/^I search for a deed using an incorrect borrower reference$/) do
  click_button('Continue')
end
