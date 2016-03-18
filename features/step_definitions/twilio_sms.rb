require 'twilio-ruby'
And(/^I get message list for borrower <(\d+)>$/) do |borrower|
  # This is only to aid development
  # put your own credentials here
  case borrower.to_i
  when 1
    @account_sid = ENV['TWILIO_ACCOUNT_SID1'].to_s
    @auth_token = ENV['TWILIO_AUTH_TOKEN1'].to_s
  when 2
    @account_sid = ENV['TWILIO_ACCOUNT_SID2']
    @auth_token = ENV['TWILIO_AUTH_TOKEN2']
  when 3
    @account_sid = ENV['TWILIO_ACCOUNT_SID3']
    @auth_token = ENV['TWILIO_AUTH_TOKEN3']
  when 4
    @account_sid = ENV['TWILIO_ACCOUNT_SID4']
    @auth_token = ENV['TWILIO_AUTH_TOKEN4']
  end

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.list.each do |message|
    puts message.body
  end
end

And(/^I get auth code for borrower <(\d+)>$/) do |borrower|
  # put your own credentials here
  case borrower.to_i
  when 1
    @account_sid = ENV['TWILIO_ACCOUNT_SID1']
    @auth_token = ENV['TWILIO_AUTH_TOKEN1']
  when 2
    @account_sid = ENV['TWILIO_ACCOUNT_SID2']
    @auth_token = ENV['TWILIO_AUTH_TOKEN2']
  when 3
    @account_sid = ENV['TWILIO_ACCOUNT_SID3']
    @auth_token = ENV['TWILIO_AUTH_TOKEN3']
  when 4
    @account_sid = ENV['TWILIO_ACCOUNT_SID4']
    @auth_token = ENV['TWILIO_AUTH_TOKEN4']
  end

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token
  # Takes code from latest message
  @latest_msg = @client.account.messages.list[0].body.to_s
  @auth_code = @latest_msg.split(' ')[-1].chop
  puts "Auth code is: #{@auth_code}"
end
