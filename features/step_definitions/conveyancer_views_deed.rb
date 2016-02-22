And(/^I retrieve the deed using a different business unit id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api_test + relative_get_path)
end

When(/^I retrieve the deed using the same business unit id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api + relative_get_path)
end
