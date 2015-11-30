Given(/^I reach the borrower start page$/) do
  visit(Env.borrower_frontend)
end

Then(/^when I click on the "([^"]*)" button$/) do |link_button|
  page.click_link(link_button)
end

Then(/^I should reach the borrower identity verified page$/) do
  expect(page).to have_content('Identity verified')
end
