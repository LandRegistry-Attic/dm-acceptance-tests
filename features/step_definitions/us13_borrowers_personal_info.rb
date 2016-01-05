Given(/^I have deed data without a borrowers address$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:address] = ''
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrowers address with no postcode$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:address] = '1 The High Street Highley'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrowers address with a non UK postcode$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:address] = '8 Rue de Champignon 75008 Paris'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower that has two mobile phone numbers$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:phone_number] = '07507154072, 07528670998'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower that has no mobile phone number$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:phone_number] = ''
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with two borrowers with the same mobile number$/) do
  @deed = Deed.new(2)
  @deed.borrowers[0][:phone_number] = '07507154077'
  @deed.borrowers[1][:phone_number] = '07507154077'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower that has no date of birth$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:dob] = ''
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower that has two date of births$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:dob] = '21/09/1965, 24/07/2000'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower with invalid format date of birth$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:dob] = '1965/09/21'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower that has an invalid date of birth$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:dob] = '32/09/1965'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with two borrowers one that has an invalid gender$/) do
  @deed = Deed.new(2)
  @deed.borrowers[1][:gender] = 'Troll'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with two borrowers one which has no gender$/) do
  @deed_hash = {
    title_number: 'DT567568',
    md_ref: 'e-MD123G',
    borrowers: [
      {
        forename: 'Katie',
        middle_name: 'Elizabeth',
        surname: 'Smythe',
        gender: 'Female',
        address: '1 The High Street Highley CR0 9YH',
        dob: '29/09/1965',
        phone_number: '07507154077'
      },
      {
        forename: 'Paul',
        surname: 'Smythe',
        address: '1 The High Street Highley PL6 7TG',
        dob: '29/09/2000',
        phone_number: '07507154076'
      }
    ]
  }
end
