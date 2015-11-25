Given(/^I add the following deed:$/) do |deed|
  deed_end_point = Env.deed_api + '/deed/'
  @response = HTTP.post(deed_end_point, json: JSON.parse(deed))
  puts @response
end

And(/^a message for failure is given "([^"]*)"$/) do |failure_reason|
   assert_match(failure_reason, @response)
 end
