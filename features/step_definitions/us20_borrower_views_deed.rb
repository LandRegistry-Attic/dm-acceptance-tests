Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I search for the created deed$/) do
  url = JSON[@response.body]["url"]
  split_url = url.split('/')
  @deed_id = split_url[4]
  fill_in 'deed_reference', with: @deed_id
  click_button('Search')
end

Then(/^the Your mortgage deed page is displayed$/) do
  page.should have_content('Your mortgage deed')
  page.should have_content(@deed.title_number)
  page.should have_content(@deed.md_ref)
end

When(/^I search for an invalid deed$/) do
  click_button('Search')
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.should have_content(page_title)
end
