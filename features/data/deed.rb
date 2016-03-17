### This class is for creating deed test data to be submitted to the Deed API
class Deed
  attr_accessor :title_number
  attr_accessor :md_ref
  attr_accessor :borrowers
  attr_accessor :identity_checked
  attr_accessor :property_address

  def initialize(number_of_borrowers)
    @title_number = generate_title_number
    @md_ref = 'e-MD12344'
    @borrowers = generate_borrowers(number_of_borrowers)
    @identity_checked = 'Y'
    @property_address = '1 High Street, High Wycombe, CR0 6TY'
  end

  def generate_title_number
    "DMA#{rand(0..99999)}"
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end

  def generate_random_date
    year = Random.new.rand(1920..2000)
    month = Random.new.rand(1..12)
    day = Random.new.rand(1..28)
    Date.new(year, month, day).strftime('%d/%m/%Y')
  end

  def generate_borrowers(number_of_borrowers)
    # Sets up the borrower data
    borrower_data = []
    borrower_data.push(
      forename: 'Jayne',
      surname: 'Cobb',
      gender: 'Female',
      address: '1B Borrower Street, Plymouth, PL3 2PP',
      dob: generate_random_date,
      phone_number: ENV['PHONE_NUMBER1']
    )
    borrower_data.push(
      forename: 'Mark',
      middle_name: 'James',
      surname: 'Strong',
      gender: 'Male',
      address: '2B Borrower Street, Plymouth, PL3 2PP',
      dob: generate_random_date,
      phone_number: ENV['PHONE_NUMBER2']
    )
    borrower_data.push(
      forename: 'Sue',
      middle_name: 'Anne',
      surname: 'Randall',
      gender: 'Female',
      address: '3B Borrower Street, Plymouth, PL3 2PP',
      dob: generate_random_date,
      phone_number: ENV['PHONE_NUMBER3']
    )
    borrower_data.push(
      forename: 'Lee',
      surname: 'Thomson',
      gender: 'Male',
      address: '4B Borrower Street, Plymouth, PL3 2PP',
      dob: generate_random_date,
      phone_number: ENV['PHONE_NUMBER4']
    )

    # Adds the borrowers data to the deed
    borrowers = []
    number_of_borrowers.times do |borrower_number|
      borrowers.push(borrower_data[borrower_number])
    end
    puts "Borrowers Info: #{borrowers}"
    borrowers
  end
end
