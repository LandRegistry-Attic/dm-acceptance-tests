
Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I search for an invalid deed$/) do
  click_button ('Search') # Write code here that turns the phrase above into concrete actions
end

Then(/^the "([^"]*)" page is displayed$/) do |arg1|
  page.should have_content('Deed was not found for:')
end
