# Requests authentication code for specified borrower
And(/^I request an authentication code for borrower <(\d+)>$/) do |borrower|
  step %(I set the authentication messages) if @send_auth.to_s.length == 0
  step %(I get last 4 digits of phone number for borrower <#{borrower}>)
  step %(the text "Receiving your authentication code" is displayed on the page)
  step %(the text "#{@send_auth}#{@last_digits}" is displayed on the page)
  click_on('Send my code')
end

# Checks page for authentication code text,then enters the authentication code
Given(/^I enter an authentication code$/) do
  step %(the text "Enter your authentication code" is displayed on the page)
  step %(the text "#{@sent_auth}#{@last_digits}" is displayed on the page)
  # Get Code will go here
  click_button('Confirm mortgage')
end

# Gets last 4 digits of the required borrower's phone number
And(/^I get last 4 digits of phone number for borrower <(\d+)>$/) do |borrower|
  phone_number = @deed.borrowers[borrower.to_i - 1][:phone_number]
  @last_digits = phone_number[phone_number.length - 4, phone_number.length - 1]
end

# Sets the messages seen before and after requesting code
And(/^I set the authentication messages$/) do
  @send_auth = 'We will be sending your authentication code by text message'\
  ' to your mobile number ending '
  @sent_auth = 'We have just sent your authentication code by text message'\
  ' to your mobile number ending '
end
