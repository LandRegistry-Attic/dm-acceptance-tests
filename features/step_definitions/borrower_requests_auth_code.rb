# Gets last 4 digits of borrowers phone number
And(/^I request an authentication code$/) do
  # Check for full message
  step %(I get last 4 digits of phone number)
  step %(I set the authentication messages)
  step %(the text "Receiving your authentication code" is displayed on the page)
  step %(the text "#{@send_auth}#{@last_digits}" is displayed on the page)
  click_on('Send my code')
end

Given(/^I enter an authentication code$/) do
  step %(the text "Enter your authentication code" is displayed on the page)
  step %(the text "#{@sent_auth}#{@last_digits}" is displayed on the page)
  step %(the text "" is displayed on the page)
  # Get Code
  click_button('Confirm mortgage')
end

And(/^I get last 4 digits of phone number$/) do
  bor ||= 1
  phone_number = @deed.borrowers[bor.to_i - 1][:phone_number]
  @last_digits = phone_number[phone_number.length - 4, phone_number.length - 1]
end

# Sets the messages seen before and after requesting code
And(/^I set the authentication messages$/) do
  @send_auth = 'We will be sending your authentication code by text message'\
  ' to your mobile number ending '
  @sent_auth = 'We have just sent your authentication code by text message'\
  ' to your mobile number ending '
end
