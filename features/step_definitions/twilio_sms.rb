require 'twilio-ruby'

And(/^I get SMS$/) do
  # Get your Account Sid and Auth Token from twilio.com/user/account
  account_sid = 'AC77e5da1ea0fea7ff8603ce4cc6e24002'
  auth_token = '3c4c42eb9be58411f0d2e91edb853afb'
  @client = Twilio::REST::Client.new account_sid, auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
  @message = @client.account.messages.get("SM9d3941223eb842eebafd8c85f017ff0c")
  puts @message.body
end

And(/^I post SMS$/) do
  # put your own credentials here
  account_sid = 'AC77e5da1ea0fea7ff8603ce4cc6e24002'
  auth_token = '3c4c42eb9be58411f0d2e91edb853afb'

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
                                      :from => '+447481362536',
                                      :to => '07561137984',
                                      :body => 'Cucumber Test: Your HMLR code is: 123456',
                                  })
  puts 'SENT MESSAGE'
end

And(/^I get message list$/) do
  # put your own credentials here
  account_sid = 'AC77e5da1ea0fea7ff8603ce4cc6e24002'
  auth_token = '3c4c42eb9be58411f0d2e91edb853afb'

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.list().each do |message|
    puts message.body
  end
end

And(/^I get latest message$/) do
  # put your own credentials here
  account_sid = 'AC77e5da1ea0fea7ff8603ce4cc6e24002'
  auth_token = '3c4c42eb9be58411f0d2e91edb853afb'

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @latest_msg = @client.account.messages.list[0].body
  puts @latest_msg
end