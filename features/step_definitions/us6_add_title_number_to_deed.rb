Given(/^I have a valid title number$/) do
  px = Pxeger.new('^([A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT])$')
  @title_number = px.generate
  #puts @title_number.to_s
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
