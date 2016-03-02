And(/^I request an authentication code$/) do
  step %(the text "Receiving your authentication code" is displayed on the page)
  # DO Verify last 4 digits of phone number
  click_on('Send my code')
end

Given(/^I enter an authentication code$/) do
  step %(the text "Enter your authentication code" is displayed on the page)
  # Get Code
  click_button('Confirm mortgage')
end
