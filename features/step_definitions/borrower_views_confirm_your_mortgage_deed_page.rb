Given(/^I view the confirm your mortgage deed page$/) do
  step %(borrower <1> views the deed)
  step %(I request an authentication code for borrower <1>)
  step %(I get auth code for the borrower)
end
