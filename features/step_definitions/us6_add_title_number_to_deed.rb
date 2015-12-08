Given(/^I have deed data with two title numbers$/) do
  @deed = Deed.new(1)
  @deed.title_number = 'DT567568, DN573253'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with an invalid format title number$/) do
  @deed = Deed.new(1)
  @deed.title_number = 'ABCD1234/D'
  @deed_hash = @deed.to_hash
end
