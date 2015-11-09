Given(/^I visit the Site$/) do
  visit(Env.test)
end

When(/^I click the button$/) do
  click_link('Contact')
end

Then(/^I arrive at a page$/) do
  expect(page).to have_content('Get in Touch')
end
