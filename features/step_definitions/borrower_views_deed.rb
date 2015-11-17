
Given(/^I have created a deed with two borrowers$/) do
  step %(I have a valid deed)
  step %(I create a deed using Deed API)
  url = @response.body.to_s
  split_url = url.split('/')
  @deed_id = split_url[4]
end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I search for the created deed$/) do
  fill_in 'deed_reference', with: @deed_id
  click_button('Search')
end

Then(/^the “Your mortgage deed" page is displayed$/) do
  page.should have_content('Your mortgage deed')
  page.should have_content(@deed[:title_number])
end

When(/^I search for an invalid deed$/) do
  click_button('Search')
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.should have_content(page_title)
end
