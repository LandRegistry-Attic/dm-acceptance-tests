Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

Then(/^when I click on the "([^"]*)" button$/) do |button_name|
  page.click_button(button_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.should have_content(page_title)
end

Then(/^the text "([^"]*)" is displayed on the page$/) do |search_text|
  page.should have_content(search_text)
end

Then(/^the error "([^"]*)" should be displayed$/) do |error_message|
  page.should have_content(error_message)
end

Then(/^the following "([^"]*)" should be displayed$/) do |words|
  expect(page).to have_content(words)
end
