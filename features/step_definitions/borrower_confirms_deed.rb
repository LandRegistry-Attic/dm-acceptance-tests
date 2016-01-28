Then(/^I confirm the mortgage deed$/) do
  click_button('Save')
end

Then(/^a confirmation page is displayed$/) do
  page.should have_css('h3', :text => '???')
  page.should have_content('????')
end
