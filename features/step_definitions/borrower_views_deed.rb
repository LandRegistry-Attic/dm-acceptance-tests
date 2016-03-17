And(/^I retrieve the unique user id using the URL$/) do
  @response = HTTP.get(Env.deed_api_buid_a + '/deed/' + @deed_id)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][0]['token']
end

# Retrieves ID for specific Borrower. OR first borrower by default
And(/^I retrieve the unique user id for borrower (?:<(\d+)>)?$/) do |borrower|
  borrower ||= 1
  @response = HTTP.get(Env.deed_api_buid_a + '/deed/' + @deed_id)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][borrower.to_i - 1]['token']
end

And(/^I retrieve unique user id for deed created by conveyancer two$/) do
  @response = HTTP.get(Env.deed_api_buid_b + '/deed/' + @deed_id)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][0]['token']
end

Then(/^the Title number is displayed$/) do
  page.should have_content(@deed.title_number)
end

Then(/^the Mortgage document reference is displayed$/) do
  page.should have_content(@deed.md_ref)
end

And(/^the Lender is displayed on the deed$/) do
  page.should have_css('h3', text: 'Lender')
  page.should have_content('Bank of England Plc 12 Trinity Place, Regents '\
                           'Street, London NW10 6TQ Company registration '\
                           'number: 2347676')
end

And(/^the Additional provision is displayed on the deed$/) do
  page.should have_css('h3', text: 'Additional provisions')
  page.should have_content('This Mortgage Deed incorporates the Lenders '\
                           'Mortgage Conditions and Explanation 2006, a '\
                           'copy of which the borrower has received. The '\
                           'lender is obliged to make further advances '\
                           'and applies for the obligation to be entered '\
                           'in the register. The borrower applies to enter '\
                           'a restriction in the register that no '\
                           'disposition of the registered estate by the '\
                           'proprietor of the registered estate is to be '\
                           'registered without a written consent signed by '\
                           'the proprietor for the time being of the charge '\
                           'dated [the date of this charge] in favour of '\
                           'Bank of England Plc referred to in the charges '\
                           'register.')
end

And(/^the Charging clause is displayed on the deed$/) do
  page.should have_css('h3', text: 'Charging clause')
  page.should have_content('The borrower, with full title guarantee, charges '\
                           'to the lender the property by way of legal '\
                           'mortgage with payment of all money secured by '\
                           'this charge.')
end

Then(/^the effective date element is present on page$/) do
  page.should have_content('This charge takes effect when the registrar '\
                           'receives notification from Land Registry Devices '\
                           ' that the charge is to take effect.')
  page.should have_content('[Effective date and time will be shown here]')
end

Then(/^the effective date element for the second Lender is present on page$/) do
  page.should have_content('This charge takes effect when the registrar '\
                           'receives notification from Land Registry Test '\
                           'that the charge is to take effect.')
  page.should have_content('[Effective date and time will be shown here]')
end

# Checks that no borrower has signed
Then(/^the borrower signature elements are present on page/) do
  @deed.borrowers.each do |borrower|
    page.should have_content('[Awaiting confirmation from '\
                             "#{borrower[:forename]} #{borrower[:surname]}]")
  end
end

And(/^confirm your deed information text is displayed on the deed page$/) do
  page.should have_content('If you’re ready to confirm your mortgage, we’ll'\
  ' send you an authentication code which you’ll need to'\
                ' enter on the next screen')
  page.should have_content('If you do not wish to confirm the mortgage deed'\
  ' (for instance if you think there is a mistake or you want'\
                ' further explanation) you should contact your conveyancer.')
end

# Use when viewing deed, to verify a previous signing has occurred
Then(/^I verify borrower <(\d+)> has signed the deed$/) do |bor|
  f_name = @deed.borrowers[bor.to_i - 1][:forename]
  m_name = @deed.borrowers[bor.to_i - 1][:middle_name]
  s_name = @deed.borrowers[bor.to_i - 1][:surname]
  page.should have_content('Confirmed by '\
                           "#{f_name} #{m_name} #{s_name}")
end

# Use when viewing deed, to verify specific Borrower has not signed
Given(/^the borrower <(\d+)> signature element is present on page$/) do |bor|
  f_name = @deed.borrowers[bor.to_i - 1][:forename]
  m_name = @deed.borrowers[bor.to_i - 1][:middle_name]
  s_name = @deed.borrowers[bor.to_i - 1][:surname]
  page.should have_content("[Awaiting confirmation from #{f_name}"\
                             "#{m_name} #{s_name}]")
end

Then(/^the Coventry Building Society mortgage deed is displayed$/) do
  page.should have_css('h3', text: 'Lender')
  page.should have_content('COVENTRY BUILDING SOCIETY Economic House '\
                           'PO Box 9, High Street Coventry CV1 5QN')

  page.should have_css('h3', text: 'Charging clause')
  page.should have_content('The borrower, with full title guarantee, charges '\
                           'to the lender the property by way of legal '\
                           'mortgage with payment of all money secured by '\
                           'the charge.')

  page.should have_css('h3', text: 'Additional provisions')
  page.should have_content('The borrower acknowledges receipt of the '\
                           'advance specified in the offer.')

  page.should have_content('This mortgage deed incorporates the Mortgage '\
                           'Conditions (Issue \'J\') which have been laid '\
                           'down by the Board of Directors of the lender and '\
                           'of which a copy has been supplied to the borrower.')

  page.should have_content('This mortgage deed is made for securing further '\
                           'advances (including re-advances)')

  page.should have_content('The borrower as a member of the Coventry Building '\
                           'Society will during the existence of this '\
                           'mortgage deed be bound by the Rules of the '\
                           'Society in force from time to time including '\
                           'rules adopted and amendments made after the date '\
                           'of this mortgage deed, except insofar as the '\
                           'Rules are expressly modified by the Mortgage '\
                           'Conditions and this mortgage deed.')

  page.should have_content('The borrower applies to the Chief Land Registrar '\
                           'to enter the following restriction in the '\
                           'Proprietorship Register of the property:')

  page.should have_content('No disposition of the registered estate by the '\
                           'proprietor of the registered estate or by the '\
                           'proprietor of any registered charge, not being a '\
                           'charge registered before the entry of this '\
                           'restriction, is to be registered without a '\
                           'written consent signed by the proprietor for the '\
                           'time being of the charge dated '\
                           '[the date of this charge] in favour of Coventry '\
                           'Building Society referred to in the Charges '\
                           'Register')
end
