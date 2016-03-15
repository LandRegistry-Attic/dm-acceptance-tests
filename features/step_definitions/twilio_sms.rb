require 'twilio-ruby'

And(/^I get SMS$/) do
  # Get your Account Sid and Auth Token from twilio.com/user/account
  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new @account_sid, auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
  @message = @client.account.messages.get("[Insert_msg_ID]")
  puts @message.body
end

And(/^I post SMS$/) do
  # put your own credentials here
  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.create({
                                      :from => '+447481362536',
                                      :to => '',
                                      :body => 'Cucumber Test: Your HMLR code is: 123456',
                                  })
  puts 'SENT MESSAGE'
end

And(/^I get message list$/) do
  # put your own credentials here
  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new @account_sid, @auth_token

  @client.account.messages.list().each do |message|
    puts message.body
  end
end

And(/^I get latest message$/) do
  # put your own credentials here
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token
# Place holder
  @latest_msg = @client.account.messages.list[0].body.to_s
  @auth_code = @latest_msg.split(' ')[-1]
  puts "Auth code is: #{@auth_code}"

end