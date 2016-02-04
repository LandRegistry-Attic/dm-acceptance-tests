When(/^I search the deed store$/) do
  str_end = '/deed?md_ref=e-MD12344&title_number='
  deed_end_point = Env.deed_api + str_end + @title_number.to_s
  @response = HTTP.get(deed_end_point)

  # Open the URL in browser to check information
  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  full_str = head + @deed.title_number.to_s
  visit(full_str)
end

When(/^I search the deed store with title_number "([^"]*)"$/) do |title_number|
  # Open the URL in browser to check information
  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  full_str = head + title_number.to_s
  visit(full_str)
end

Given(/^I create the deed with title_number "([^"]*)"$/) do |title_num|
  # Using to create deed with specific title number
  @deed = Deed.new(1)
  @deed.title_number = title_num
  @deed_hash = @deed.to_hash
end

Given(/^I create the 2nd deed with title_number <(\d+)>$/) do |title_num|
  # Using to create deed with specific title number
  @deed2 = Deed.new(1)
  @deed2.title_number = title_num
  @deed_hash2 = @deed2.to_hash
end
