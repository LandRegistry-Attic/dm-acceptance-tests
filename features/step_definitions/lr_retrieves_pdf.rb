When(/^I retrieve a pdf using the deed id$/) do
  get_pdf_endpoint = Env.deed_api + '/casework/' + @deed_id
  @response = HTTP.get(get_pdf_endpoint)
end
