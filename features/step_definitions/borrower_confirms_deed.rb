Then(/^I confirm the mortgage deed$/) do
  click_button('Continue')
end

Then(/^a confirmation page is displayed$/) do
  page.should have_css('h3', text: 'Thank you for viewing your mortgage deed')
  page.should have_css('h2', text: 'What happens next?')
  page.should have_css('p', text: 'The online deed you\'ve viewed is not '\
                                  'the legal deed.')
  page.should have_css('li', text: 'You should sign and return your paper '\
                                   'mortgage deed following the '\
                                   'instructions you have received from '\
                                   'your conveyancer')
  page.should have_css('li', text: 'Land Registry will then update your '\
                                   'title register to include the new mortgage')
  page.should have_css('p', text: 'The time this takes will vary depending '\
                                  'on the complexity of the transaction.')
  page.should have_css('ul', text: 'More about the Land Registry')
end
