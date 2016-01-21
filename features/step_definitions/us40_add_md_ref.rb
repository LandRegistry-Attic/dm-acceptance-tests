Given(/^I have deed data with two md refs$/) do
  @deed = Deed.new(1)
  @deed.md_ref = 'e-MD12345, e-MD1234Z'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with an md ref made of a six digit number$/) do
  @deed = Deed.new(1)
  @deed.md_ref = 'e-MD123456'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data without an md ref$/) do
  @deed_hash = {
    title_number: 'DT567568',
    identity_checked: 'Y',
    borrowers: [
      {
        forename: 'Katie',
        middle_name: 'Elizabeth',
        surname: 'Kicks',
        gender: 'Male',
        address: '1 The High Street Highley PL6 7TG',
        dob: '11/01/2000',
        phone_number: '07507154077'
      }
    ]
  }
end
