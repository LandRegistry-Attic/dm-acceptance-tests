Then(/^information about the service and how to use it is displayed$/) do
  page.should have_content('Use this service to view and check your mortgage '\
                           'details are correct. The online deed is not the '\
                           'legal mortgage. You should still sign and return '\
                           'your paper mortgage deed following the '\
                           'instructions you have from your conveyancer.')

  page.should have_content('Once all parties have signed the paper mortgage '\
                           'your conveyancer will then ensure the Land '\
                           'Registry is updated.')
  page.should have_content('To do this you will need:')
  page.should have_content('a unique borrower reference sent to you by your '\
                           'conveyancer')
end
