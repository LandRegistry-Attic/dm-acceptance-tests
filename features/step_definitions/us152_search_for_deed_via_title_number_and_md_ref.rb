When(/^I search the deed store$/) do
  title_number = @deed.title_number.to_s
  full_str = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number=' + title_number
  visit(full_str)
end

Then(/^I verify the number of returned deeds is <(\d+)>$/) do |deeds|
  page.should have_content('token', :count => deeds )
  page.should have_content('status', :count => deeds )
end

When(/^I search the deed store with title_number <(\d+)>$/) do |title_number|
  title_number = title_number
  full_str = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number=DT' + title_number.to_s
  visit(full_str)
end

Then(/^no deed returned error message is displayed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
