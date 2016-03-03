Given(/^I have deed data without an md ref$/) do
  @deed_hash = {
    title_number: 'DT567568',
    identity_checked: 'Y',
    property_address: '34 Smith Street, PL8 7YH',
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
