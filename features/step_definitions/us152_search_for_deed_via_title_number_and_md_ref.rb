When(/^I search the deed store with title_number "([^"]*)"$/) do |title_number|
  # Open the URL in browser to check information
  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  full_str = head + title_number
  visit(full_str)
end

Given(/^I create the deed with title_number "([^"]*)"$/) do |title_num|
  # Using to create deed with specific title number
  @deed = Deed.new(1)
  @deed.title_number = title_num
  @deed_hash = @deed.to_hash
end
