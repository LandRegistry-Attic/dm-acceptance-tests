
Given(/^I have created a deed with two borrowers$/) do
  $db_connection = PG::Connection.open(
  host: "0.0.0.0",
  dbname: "deed_api",
  user: "vagrant",
  password: "vagrant"
)
$db_connection[:public.deed].insert[:deed]=>sequel.pg_json("title_number": "DN1"})
#$db_connection.exec("INSERT INTO public.deed(id, deed)VALUES (1, #{{"title_number": "DN1"}});")

$db_connection.close

end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I search for an invalid deed$/) do
  click_button ('Search') # Write code here that turns the phrase above into concrete actions
end

Then(/^the "([^"]*)" page is displayed$/) do |arg1|
  page.should have_content('Deed was not found for:')
end
