And(/^I get auth code for the borrower$/) do
  api_key = ENV['TEXT_LOCAL_API_KEY']
  inbox_id = ENV['TEXT_LOCAL_INBOX_ID']

  request_url = 'http://api.txtlocal.com/get_messages/?' + 'apikey=' + api_key +
                '&inbox_id=' + inbox_id
  response = HTTP.get(request_url)
  response_json = JSON.parse(response)
  num_messages = response_json['messages'].length
  split_msg = response_json['messages'][num_messages - 1]['message'].split(' ')
  @auth_code = split_msg[0]
end

When(/^I enter the wrong authentication code$/) do
  fill_in 'auth_code', with: '123456789'
  click_button('Confirm mortgage')
end
