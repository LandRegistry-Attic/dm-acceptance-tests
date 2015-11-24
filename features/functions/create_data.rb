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

def generate_gender_male
  {
    gender: 'M'
}
end

def generate_borrower_address
  {
    address: '1 High Street, Dudley, PL6 6TG'
}
end

def generate_dob
  {
    dob: '11/01/1993'
}
end

def generate_phone_number
  {
    phone_number: '07528670998'
}
end

############I am here just adding defs for all fields below##############

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
