require 'twilio-ruby'

And(/^I get message list$/) do
  # put your own credentials here
  @account_sid = ENV['ACCOUNT_SID']
  @auth_token = ENV['AUTH_TOKEN']

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.list.each do |message|
    puts message.body
  end
end

And(/^I get latest message auth code$/) do
  # put your own credentials here
  @account_sid = ENV['ACCOUNT_SID']
  puts "ACCOUNT SID IS: #{@account_sid}"
  @auth_token = ENV['AUTH_TOKEN']
  puts "AUTH TOKEN IS: #{@auth_token}"

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token
  # Place holder
  @latest_msg = @client.account.messages.list[0].body.to_s
  @auth_code = @latest_msg.split(' ')[-1].chop
  puts "Auth code is: #{@auth_code}"
end
