Given(/^I have valid deed data with <(\d+)> borrowers$/) do |num_borrowers|
  borrowers = num_borrowers.to_i
  @deed = Deed.new(borrowers)
  @deed_hash = @deed.to_hash
end

When(/^I create the deed via the Deed API$/) do
  deed_end_point = Env.deed_api + '/deed/'
  @response = HTTP.post(deed_end_point, json: @deed_hash)
end

Given(/^the deed id is returned by the Deed API$/) do
  response_hash = JSON.parse(@response.body)
  split_response = response_hash['path'].split('/')
  @deed_id = split_response[2]
end

Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(code, @response.code.to_s)
end

Then(/^a url link to retrieve the deed is returned$/) do
  assert_match('/deed/', @response.body)
end

And(/^a message for failure is given "([^"]*)"$/) do |failure_reason|
  assert_match(failure_reason, @response)
end

And(/^I know the borrower id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api + relative_get_path)

  data = JSON.parse(@response)
  @borrower_id = data['deed']['borrowers'][0]['id']
end
