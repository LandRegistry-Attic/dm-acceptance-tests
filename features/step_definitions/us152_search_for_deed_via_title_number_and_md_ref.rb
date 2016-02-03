When(/^I search the deed store$/) do
  #http://10.10.10.10:5000/deed?md_ref=e-MD12344&title_number=DT107
  str_head = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number='
  title_number = @title_number.to_s

  #full_str = str_head + md_ref + str_mid + title_number
  #full_str = 'http://10.10.10.10:9020/deed?md_ref=#{@md_ref}&title_number=#{@title_number}'
  full_str = 'http://10.10.10.10:9020/deed?md_ref=e-MD12344&title_number=DT107'
  visit(full_str)
end

Then(/^I verify returned information$/) do
page.should have_content(@md_ref)
page.should have_content(@title_number)
end
