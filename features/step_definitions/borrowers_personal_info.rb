Given(/^I add the following deed:$/) do |deed|
  deed_end_point = Env.deed_api + '/deed/'
  @response = HTTP.post(deed_end_point, json: JSON.parse(deed))
  @message = @response.body
end

And(/^a message for failure is given "([^"]*)"$/) do |arg1|
    @message.should_include?(arg1)

end
