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

Then(/^the conform with Data Protection Law text is displayed$/) do
  page.should have_content('By using this service you consent to Land '\
                           'Registry retaining your personal details for '\
                           'fraud prevention and detection purposes. You also '\
                           'consent to Land Registry carrying out third party '\
                           'checks in relation to the information supplied. '\
                           'For further information please view our '\
                           'Personal Information Charter')
end

And(/^a link to Personal Information Charter is displayed$/) do
  page.should have_link('Personal Information Charter.', href: 'https://www.gov.uk/government/organisations/land-registry/about/personal-information-charter')
end
