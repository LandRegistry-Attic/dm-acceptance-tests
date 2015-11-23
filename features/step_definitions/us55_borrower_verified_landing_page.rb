Given(/^I reach the Borrower Identity Verified Page$/) do
  visit(Env.borrower_frontend)
end

Then(/^I should see the "([^"]*)" button$/) do |link|
  page.should have_selector(:link_or_button, link)
end

Then(/^the following "([^"]*)" should be displayed$/) do |words|
  expect(page).to have_content(words)
end
