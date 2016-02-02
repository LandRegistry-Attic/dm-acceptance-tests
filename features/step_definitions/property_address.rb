Given(/^I do not have a property address to provide$/) do
  @deed = Deed.new(1)
  @deed.property_address = ''
  @deed_hash = @deed.to_hash
end

Given(/^I have a property address that is formatted with commas$/) do
  @deed = Deed.new(1)
  @deed.property_address = '256 King Henrys Drive, New Addington, Croydon, '\
  'CR7 6TH'
  @deed_hash = @deed.to_hash
end

And(/^the property address is formatted correctly$/) do
  expected_address = @deed.property_address.split(', ')
  actual_address = page.all(:css, '.deed-address-list li').map(&:text)
  actual_address.zip(expected_address).each do |actual, expected|
    actual.should eq(expected)
  end
end
