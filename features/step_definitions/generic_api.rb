Given(/^I have valid deed data with <(\d+)> borrowers$/) do |num_borrowers|
  borrowers = num_borrowers.to_i
  @deed = Deed.new(borrowers)
  @deed_hash = @deed.to_hash
end

When(/^I create the deed via the Deed API$/) do
  deed_end_point = Env.deed_api + '/deed/'
  @response = HTTP.post(deed_end_point, json: @deed_hash)
  puts @response.body
end

Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(code, @response.code.to_s)
end

Then(/^a url link to retrieve the deed is returned$/) do
  deed_end_point = Env.deed_api + '/deed/'
  assert_match(deed_end_point, @response.body)
end

And(/^a message for failure is given "([^"]*)"$/) do |failure_reason|
  assert_match(failure_reason, @response)
end

And(/^I know the borrower id$/) do
  deed_end_point = JSON[@response.body]['url']
  @response = HTTP.get(deed_end_point)

  data = JSON.parse(@response)
  @borrower_id = data['deed']['borrowers'][0]['id']
end
