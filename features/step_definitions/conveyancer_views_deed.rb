Given(/^I have created a deed$/) do
  @deed = Deed.new(1)
  @deed_hash = @deed.to_hash
  step %(I create the deed via the Deed API)
end

Given(/^a different Business Unit has created a deed$/) do
  @deed = Deed.new(2)
  @deed_hash = @deed.to_hash
  step %()
end

And(/^I retrieve the deed using a different business unit id$/) do
  relative_get_path = JSON[@response.body]['path']
  @response = HTTP.get(Env.deed_api_test + relative_get_path)
end
