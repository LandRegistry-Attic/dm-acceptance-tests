When(/^I search the deed store with title_number "([^"]*)"$/) do |title_number|
  # Open the URL in browser to check information
  url_head = Env.deed_api + '/deed?md_ref=' + @deed.md_ref + '&title_number='
  full_url = url_head + title_number
  @response = HTTP.get(full_url)
end

Given(/^I create the deed with title_number "([^"]*)"$/) do |title_num|
  # Using to create deed with specific title number
  @deed = Deed.new(1)
  @deed.title_number = title_num
  @deed_hash = @deed.to_hash
end

Then(/^I verify the returned deed information$/) do
  data = JSON.parse(@response)
  if data.length > 0
    deed_count = 0
    # Checks each returned deed for key values: status, token. And value DRAFT.
    while deed_count <= (data.length - 1)
      status = data[deed_count].include?('status')
      token = data[deed_count].include?('token')
      draft = data[deed_count]['status'].include?('DRAFT')
      tok_val = data[deed_count]['token'].nil?
      # Fails if the first 3 above checks = false, or the last =  true
      if status == false || token == false || draft == false || tok_val == true
        abort('Status or Token is not returned as expected')
      end
      deed_count += 1
    end
  else
    abort('No Data is returned')
  end
end
