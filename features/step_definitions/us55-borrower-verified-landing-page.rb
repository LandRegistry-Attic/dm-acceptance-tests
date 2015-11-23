Given(/^I reach the Borrower Identity Verified Page$/) do
  visit(Env.borrower_landing_page)
end

Then(/^I should see Continue to mortgage$/) do
  page.should have_selector(:link_or_button, 'Continue to mortgage')
end

Then(/^the following Read your mortgage details$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
