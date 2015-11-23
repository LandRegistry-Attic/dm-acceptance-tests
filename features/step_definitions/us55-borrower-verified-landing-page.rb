Given(/^I reach the Borrower Identity Verified Page$/) do
  visit(Env.borrower_frontend)
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.should have_selector(:link_or_button, arg1)
end

Then(/^the following "([^"]*)"$/) do |arg2|
  expect(page).to have_content(arg2)
end
