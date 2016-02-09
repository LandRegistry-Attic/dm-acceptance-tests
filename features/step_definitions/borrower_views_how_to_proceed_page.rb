Then(/^instructions for viewing your mortgage should be displayed$/) do
  page.should have_content("Now you've signed in you can view an online "\
                           'version of your mortgage deed. You should:')
  page.should have_content('Read your mortgage deed carefully')
  page.should have_content('Compare the online version of the deed with '\
                           'the paper version you have received from your '\
                           'conveyancer. If you spot any mistakes you should '\
                           'let your conveyancer know.')
  page.should have_content('Sign your paper mortgage deed')
  page.should have_content('The online deed is not the legal mortgage. You '\
                           'should still sign and return your paper mortgage '\
                           'deed following the instructions you have from '\
                           'your conveyancer.')
end
