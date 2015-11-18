Given(/^I have a deed with a borrower with no middle name$/) do
  @deed = create_deed_hash
end

Given(/^I have a deed with no borrowers$/) do
  @deed = {
      title_number: generate_title_number,
      borrowers: {}
  }
end
