Then(/^a link to submit email feedback is displayed$/) do
  link = 'mailto:digital-mortgage-feedback@digital.landregistry.gov.uk'
  page.should have_link('How could we improve this service?', href: link)
end
