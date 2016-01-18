Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I retrieve the deed id$/) do
  response_hash = JSON.parse(@response.body)
  @get_url = response_hash['url']
end

And(/^I retrieve the unique user id using the URL$/) do
  @response = HTTP.get(@get_url)
  @deed_hash = JSON.parse(@response.body)
  @borrower_token = @deed_hash['deed']['borrowers'][0]['token']
end

And(/^I search for the deed using the unique user id$/) do
  fill_in 'borrower_token', with: @borrower_token
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
