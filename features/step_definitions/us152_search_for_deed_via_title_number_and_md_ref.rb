When(/^I search the deed store$/) do
  str_end = '/deed?md_ref=' + @md_ref.to_s + '&title_number='
  deed_end_point = Env.deed_api + str_end + @title_number.to_s
  @response = HTTP.get(deed_end_point)

  # Open the URL in browser to check information
  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  full_str = head + @deed.title_number.to_s
  visit(full_str)
end

When(/^I search the deed store with title_number <(\d+)>$/) do |title_number|
  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number=DT'
  full_str = head + title_number.to_s
  visit(full_str)
end

Given(/^I create the deed with title_number <(\d+)>$/) do |title_num|
  # Using to create deed with specific title number
=begin
  @deed = Deed.new(1)
  @deed.title_number = title_num
  @deed_hash = @deed.to_hash
=end
  require 'pry'
  binding.pry
  str_end = '/deed?md_ref=e-MD12344&title_number=DT' + title_num.to_s
  deed_end_point = Env.deed_api + str_end
  @response = HTTP.get(deed_end_point)

  head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number=DT'
  full_str = head + title_num.to_s
  visit(full_str)
end
