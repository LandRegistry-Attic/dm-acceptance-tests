
def generate_title_number
  title_number = Pxeger.new('^([A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT])$')
  title_number.generate
end

def generate_new_borrower_no_middle
  {
    forename: 'James',
    surname: 'Bond'
  }
end

def generate_new_borrower_with_middle
  {
    forename: 'James',
    middle_name: 'Hello',
    surname: 'Bond'
  }
end

# rubocop:disable all
def create_deed_hash(title_number = generate_title_number,
                     new_borrower1 = generate_new_borrower_no_middle,
                     gender = generate_gender_male,
                     address = generate_borrower_address,
                     dob = generate_dob,
                     phone_number = generate_phone_number
                    )
  {
    title_number: title_number,
    borrowers: [new_borrower1],
    gender: [gender],
    address: [address],
    dob: [dob],
    phone_number: [phone_number]
  }
end
# rubocop:enable all
