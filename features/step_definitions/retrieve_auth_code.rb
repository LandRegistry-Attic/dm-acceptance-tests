And(/^I get auth code for borrower <(\d+)>$/) do |borrower|
  # Gets credentials from environment variables
  #@account_sid = ENV["TWILIO_ACCOUNT_SID#{borrower}"]
  #@auth_token = ENV["TWILIO_AUTH_TOKEN#{borrower}"]

  api_key = 't8nyztjNc5g-Dwl3vivGuE2yOz4d4Gi1VFcdcRkP1Z'
  inbox_id = '945541'

  # set up a client to talk to the Twilio REST API
  #@client = Twilio::REST::Client.new @account_sid, @auth_token
  # Takes code from latest message
  #@latest_msg = @client.account.messages.list[0].body.to_s
  #@auth_code = @latest_msg.split(' ')[-1].chop
  #puts "Auth code is: #{@auth_code}"

  request_url = 'http://api.txtlocal.com/get_messages/?' + "apikey=" + api_key + "&inbox_id=" + inbox_id
  response = HTTP.get(request_url)
  response_json = JSON.parse(response)
  require 'pry'
  binding.pry
end
