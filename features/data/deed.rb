### This class is for creating deed test data to be submitted to the Deed API
class Deed
  attr_accessor :title_number
  attr_accessor :md_ref
  attr_accessor :borrowers

  def initialize(number_of_borrowers)
    @title_number = generate_title_number
    @md_ref = generate_md_ref
    @borrowers = generate_borrowers(number_of_borrowers)
  end

  def generate_title_number
    /[A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT]/.random_example
  end

  def generate_md_ref
    /e-MD([1-9]{5}|([1-9]{3,4}[A-Z]{1}))/.random_example
  end

  def generate_borrowers(number_of_borrowers)
    borrowers = []
    number_of_borrowers.times do |borrower_number|
      borrowers.push(
        forename: 'Jayne',
        surname: 'Cobb',
        gender: "#{/Male|Female|Not Specified/.random_example}",
        address: "#{borrower_number}B Borrower Street, Plymouth, PL3 2PP",
        dob: "#{Time.new.strftime('%d/%m/%Y')}",
        phone_number: "07#{/[0-9]{9}/.random_example}"
      )
    end
    borrowers
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end
end
