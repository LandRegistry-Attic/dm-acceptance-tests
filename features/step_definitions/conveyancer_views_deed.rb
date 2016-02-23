And(/^I retrieve the deed using a different business unit id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api_buid_b + relative_get_path)
end

When(/^I retrieve the deed using the same business unit id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api_buid_a + relative_get_path)
end
