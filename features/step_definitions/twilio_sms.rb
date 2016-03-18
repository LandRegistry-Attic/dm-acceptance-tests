require 'twilio-ruby'
And(/^I get auth code for borrower <(\d+)>$/) do |borrower|
  # Gets Twilio credentials from enviornment variables
  @account_sid = ENV["TWILIO_ACCOUNT_SID#{borrower}"]
  @auth_token = ENV["TWILIO_AUTH_TOKEN#{borrower}"]

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token
  # Takes code from latest message
  @latest_msg = @client.account.messages.list[0].body.to_s
  @auth_code = @latest_msg.split(' ')[-1].chop
  puts "Auth code is: #{@auth_code}"
end
