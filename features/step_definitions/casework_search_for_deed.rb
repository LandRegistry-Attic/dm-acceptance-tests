When(/^I search the deed store with title_number "([^"]*)"$/) do |title_number|
  # Open the URL in browser to check information
  url_head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  full_url = url_head + title_number
  @response = HTTP.get(full_url)
end

Given(/^I create the deed with title_number "([^"]*)"$/) do |title_num|
  # Using to create deed with specific title number
  deed = Deed.new(1)
  deed.title_number = title_num
  @deed_hash = deed.to_hash
end

Then(/^I verify the returned deed information$/) do
  data = JSON.parse(@response)
  if data.length > 0
    deed_count = 0
    # Checks each returned deed for key values: status, token. And value DRAFT.
    while deed_count <= (data.length - 1)
      status = data[deed_count].keys[0].include?('status')
      token = data[deed_count].keys[1].include?('token')
      draft = data[deed_count]['status'].include?('DRAFT')

      # Fails if any of the above checks return false.
      if status == false || token == false || draft == false
        abort('status/token/DRAFT is not returned')
      end
      deed_count += 1
    end
  else
    abort('No Data is returned')
  end
end
