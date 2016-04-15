# Follows after borrower enters their authentication code and selects
# 'confirm mortgage'

And(/^The confirming in progress page is displayed$/) do
  page.should have_css('h1', text: 'Confirming...')
  page.should have_css('p', text: 'Your mortgage deed is now being confirmed. '\
                                  'This process may take a few moments to '\
                                  'complete.')
  page.should have_css('p', text: 'Please do not refresh this page, you will '\
                                  'be notified when the deed has been '\
                                  'successfully confirmed.')
end
