Given(/^I have a valid title$/) do
  @title = create_title_hash.to_json
end

Given(/^I have a title with two title numbers$/) do
  @title = {
    'title-number' => [generate_title_no, generate_title_no]
  }.to_json
end

Given(/^I have a title with an invalid title number$/) do
  @title = create_title_hash('ABCD123/EF').to_json
end

When(/^I send a valid title number$/) do
  @response = HTTP.post(Env.deed_api + "/deed/", :json => { "title-number" => "DN101" })
end

Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(@response.code.to_s, code)
end

Then(/^a url link to retrieve the title number is returned$/) do
  #still working on this
  puts @response
end
