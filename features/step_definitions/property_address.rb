Given(/^I do not have a property address to provide$/) do
  @deed = Deed.new(1)
  @deed.property_address = ''
  @deed_hash = @deed.to_hash
end

Given(/^I have a property address that is formatted with commas$/) do
  @deed = Deed.new(1)
  @deed.address = '256 King Henrys Drive, New Addington, Croydon, CR7 6TH'
  @deed.borrowers[0][:dob] = '21/09/1971'
  @deed_hash = @deed.to_hash
end

Then(/^the property address is displayed$/) do
  require 'pry'
  binding.pry
  expected_address = @deed.address.split(',')
  address_section = page.find('.deed-document-bounds p:nth-of-type(0)')

  #address_section = page.all(:css, '.deed-document-bounds p')
  actual_address = address_section[0].all('div')
  actual_address.zip(expected_address).each do |actual, expected|

    actual.should eq('expected')
  end
end
