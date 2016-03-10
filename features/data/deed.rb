### This class is for creating deed test data to be submitted to the Deed API
require 'date'
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
    /[A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT]/.random_example
  end

  def generate_borrowers(number_of_borrowers)
    borrowers = []
    number_of_borrowers.times do |borrower_number|
      year = Random.new.rand(1920..2000)
      month =Random.new.rand(1..12)
      day  = Random.new.rand(1..30)
      date = Date.new(year, month, day).strftime('%d/%m/%Y')
      borrowers.push(
        forename: 'Jayne',
        surname: 'Cobb',
        gender: "#{/Male|Female|Not Specified/.random_example}",
        address: "#{borrower_number}B Borrower Street, Plymouth, PL3 2PP",
        dob: date,
        phone_number: "07#{/[0-9]{9}/.random_example}"
      )
      puts "Borrowers Info: #{borrowers}"
    end
    borrowers
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end
end
