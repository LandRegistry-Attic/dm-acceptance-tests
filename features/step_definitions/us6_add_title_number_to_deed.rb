Given(/^I have a valid deed$/) do
  @deed = create_deed_hash
end

Given(/^I have a deed with two title numbers$/) do
  @deed = {
    title_number: [generate_title_number, generate_title_number]
  }
end

Given(/^I have a deed with an invalid title number$/) do
  @deed = create_deed_hash('ABCD123/EF')
end

When(/^I create a deed using Deed API$/) do
  @response = HTTP.post(Env.deed_api + '/deed/', json: @deed)
end

Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(code, @response.code.to_s)
end

Then(/^a url link to retrieve the title number is returned$/) do
  assert_match(Env.deed_api + '/deed/', @response.body)
end
