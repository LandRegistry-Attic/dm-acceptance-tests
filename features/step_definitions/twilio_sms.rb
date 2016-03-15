require 'twilio-ruby'

And(/^I get SMS with ID "([^"]*)"$/) do |msg_id|
  # Get your Account Sid and Auth Token from twilio.com/user/account
  @account_sid = ENV['ACCOUNT_SID']
  @auth_token = ENV['AUTH_TOKEN']
  @client = Twilio::REST::Client.new @account_sid, @auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
  @message = @client.account.messages.get("#{msg_id}")
  puts @message.body
end

And(/^I post SMS with body "([^"]*)"$/) do |msg_body|
  # put your own credentials here
  @account_sid = ENV['ACCOUNT_SID']
  @auth_token = ENV['AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.create({
                                      :from => ENV['PHONE_NUMBER'],
                                      :to => ENV['PHONE_NUMBER'],
                                      :body => "#{msg_body}",
                                  })
  puts 'SENT MESSAGE'
end

And(/^I get message list$/) do
  # put your own credentials here
  @account_sid = ENV['ACCOUNT_SID']
  @auth_token = ENV['AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.list().each do |message|
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