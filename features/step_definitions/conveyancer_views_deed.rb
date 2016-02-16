Given(/^I have created a deed$/) do
  @deed = Deed.new(1)
  @deed_hash = @deed.to_hash
  step %(I create the deed via the Deed API)
end

When(/^I search for the deed$/) do
  #GET new get end point to get the deed, this will include the BUID
  #compare BUID in post to BUID on table

  #existing get end point:
  #relative_get_path = JSON[@response.body]['path']
  #@response = HTTP.get(Env.deed_api + relative_get_path)
end
Given(/^a different Business Unit has created a deed$/) do
  @deed = Deed.new(2)
  @deed.buid = '???'
  @deed_hash = @deed.to_hash
  step %()
end
