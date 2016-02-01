Then(/^the text "([^"]*)" is displayed on the page$/) do |search_text|
  page.should have_content(search_text)
end

Then(/^the error "([^"]*)" should be displayed$/) do |error_message|
  page.should have_content(error_message)
end
