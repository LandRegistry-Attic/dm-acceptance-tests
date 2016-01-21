Then(/^the text "([^"]*)" is displayed on the page$/) do |search_text|
  page.should have_content(search_text)
end
