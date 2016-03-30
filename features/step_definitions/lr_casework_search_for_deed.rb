# Searches deed store for deed information using specified title number
When(/^I search the deed store with title_number "([^"]*)"$/) do |title_number|
  # Open the URL in browser to check information
  url_head = Env.deed_api_casework + '/deed?md_ref=' \
             @deed.md_ref + '&title_number='
  full_url = url_head + title_number
  @response = HTTP.get(full_url)
end

# Verify the returned information is correct
Then(/^I verify the returned deed information is "([^"]*)"$/) do |deed_status|
  data = JSON.parse(@response)
  if data.length > 0
    deed_count = 0
    # Checks each returned deed for key values: status, token. And deed status
    while deed_count <= (data.length - 1)
      status = data[deed_count].include?('status')
      token = data[deed_count].include?('token')
      st_val = data[deed_count.to_i]['status'].include?(deed_status)
      tok_val = data[deed_count]['token'].nil?
      # Fails if the first 3 above checks = false, or the last =  true
      if status == false || token == false || st_val == false || tok_val == true
        abort('Status or Token is not returned as expected')
      end
      deed_count += 1
    end
  else
    abort('No Data is returned')
  end
end

Given(/^I retrieve the deed token$/) do
  # Gets the deed token, taken from deed API
  dt = JSON.parse(@response.to_s)
  @token_from_deed =  dt['deed']['token']
  puts "Token from deed is: #{@token_from_deed}"
end

When(/^I search the deed store for "([^"]*)"$/) do |status|
  # Searches for the deed via API
  full_url = Env.deed_api_casework + "/deed?md_ref=#{@deed.md_ref}" +
       "&title_number=#{@deed.title_number}"

  # Gets search results
  response2 = HTTP.get(full_url)
  data = JSON.parse(response2.to_s)

  # Checks returned list, for matching deed token, to get status
  count = 0
  while count <= (data.length - 1)
    if data[count]['token'] == @token_from_deed
      puts "Tokens match"
      if data[count]['status'] == status
        puts "Status #{status} is as expected."
      else
        abort ("Status #{status} was not returned, #{data[count]['status']}")
      end
    else
      puts 'Not a match'
    end
    count += 1
  end
end
