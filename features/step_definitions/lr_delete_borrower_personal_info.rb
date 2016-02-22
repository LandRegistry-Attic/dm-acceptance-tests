When(/^I delete the borrowers personal information via the Deed API$/) do
  deed_end_point = Env.deed_casework_api +
                   "/deed/borrowers/delete/#{@borrower_id}"
  @response = HTTP.delete(deed_end_point)
end

When(/^I try to delete a borrowers details supplying an invalid Deed ID$/) do
  deed_end_point = Env.deed_casework_api + '/deed/borrowers/delete/676546'
  @response = HTTP.delete(deed_end_point)
end
