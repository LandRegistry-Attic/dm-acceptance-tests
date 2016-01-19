=begin
Given(/^I have deed data with a borrower with a middle name$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:middle_name] = 'Johnny'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with no borrowers$/) do
  @deed = Deed.new(0)
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower with no name$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:forename] = ''
  @deed.borrowers[0][:surname] = ''
  @deed_hash = @deed.to_hash
end
=end

Given(/^I have deed data where conveyancer has confirmed borrower identity check$/) do
  #create deed
  @deed = Deed.new(1)
  @deed_hash = @deed.to_hash
end
