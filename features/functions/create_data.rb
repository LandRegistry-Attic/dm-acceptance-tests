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

def create_deed_hash(title_number = generate_title_number,
                     new_borrower1 = generate_new_borrower_no_middle)
  {
    title_number: title_number,
    borrowers: [new_borrower1]
  }
end

def create_deed_hash_no_mid(title_number = generate_title_number,
                            new_borrower1 = generate_new_borrower_no_middle)
  {
    title_number: title_number,
    borrowers: [new_borrower1]
  }
end

def create_deed_hash_with_mid(title_number = generate_title_number,
                              new_borrower1 = generate_new_borrower_with_middle)
  {
    title_number: title_number,
    borrowers: [new_borrower1]
  }
end
