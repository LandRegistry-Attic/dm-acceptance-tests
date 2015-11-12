Given(/^I have a valid deed$/) do
  @title = create_deed_hash
end

Given(/^I have a deed with two title numbers$/) do
  @title = {
    title_number: [generate_title_number, generate_title_number]
  }
end

Given(/^I have a deed with an invalid title number$/) do
  @title = create_deed_hash('ABCD123/EF')
end

When(/^I create a deed using Deed API$/) do
  @response = create_deed(@title)
end

Then(/^a status code of "([^"]*)" is returned$/) do |code|
  assert_equal(@response.code.to_s, code)
end

Then(/^a url link to retrieve the title number is returned$/) do
  # still working on this
  puts @response.body
end
