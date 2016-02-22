When(/^I retrieve a pdf using the deed id$/) do
  get_pdf_endpoint = Env.deed_casework_api + '/casework/' + @deed_id
  @response = HTTP.get(get_pdf_endpoint)
end

When(/^I retrieve a pdf using an incorrect deed id$/) do
  get_pdf_endpoint = Env.deed_casework_api + '/casework/1234567'
  @response = HTTP.get(get_pdf_endpoint)
end

Then(/^the PDF is returned$/) do
  assert_equal('application/pdf', @response.mime_type)
end
