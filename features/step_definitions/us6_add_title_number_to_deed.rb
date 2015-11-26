Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(code, @response.code.to_s)
end

Then(/^a url link to retrieve the deed is returned$/) do
  deed_end_point = Env.deed_api + '/deed/'
  assert_match(deed_end_point, @response.body)
end
