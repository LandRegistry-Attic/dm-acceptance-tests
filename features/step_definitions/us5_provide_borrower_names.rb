Given(/^I have a deed with a borrower with no middle name$/) do
  @deed = create_deed_hash(generate_title_number,
                           generate_new_borrower_no_middle)
end

Given(/^I have a deed with a borrower with a middle name$/) do
  @deed = create_deed_hash(generate_title_number,
                           generate_new_borrower_with_middle)
end

Given(/^I have a deed with no borrowers$/) do
  @deed =
  {
    title_number: generate_title_number,
    borrowers: {}
  }
end

Given(/^I have a deed with an invalid borrower$/) do
  @deed = create_deed_hash('DN1001', forename: 'James')
end
