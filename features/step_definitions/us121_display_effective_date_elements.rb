Then(/^the effective date element is present on page$/) do
  page.should have_content('[Effective date and time will be shown here]')
end

Then(/^the text "([^"]*)" is displayed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
