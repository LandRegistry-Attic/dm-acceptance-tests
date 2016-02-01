Then(/^help text explaining why your deed wasn't found is displayed$/) do
  page.should have_content('the borrower reference was mistyped')
  page.should have_content('or the date of birth was not in the format dd mm '\
                           'yyyy')
  page.should have_content('If you continue to experience problems please '\
                           'contact your conveyancer.')
end
