Given(/^I do not have a property address to provide$/) do
  @deed = Deed.new(1)
  @deed.property_address = ''
  @deed_hash = @deed.to_hash
end
