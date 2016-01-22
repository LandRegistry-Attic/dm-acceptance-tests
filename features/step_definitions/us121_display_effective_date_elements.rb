Then(/^the effective date element is present on page$/) do
  page.should have_content('[Effective date and time will be shown here]')
end
