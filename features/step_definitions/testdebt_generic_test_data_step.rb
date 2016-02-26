Then(/^I override deed with "([^"]*)"$/) do |params|
  # Example use ... And I override deed with "middle_name:Synth:2"

  # Splits the params string
  split_params = params.split(':')
  var = split_params[0]
  value = split_params[1]
  opt = split_params[2]

  # Applies deed override
  case var
  when 'title_number'
    @deed.title_number = value
  when 'md_ref'
    @deed.md_ref = value
  when 'identity_checked'
    @deed.identity_checked = value
  else
    @deed.borrowers[opt.to_i - 1][:"#{var}"] = value
  end
  step %(I hash the deed)
end

Then(/^I hash the deed$/) do
  @deed_hash = @deed.to_hash
end

Given(/^I create default deed with <(\d+)> borrowers(?:,"([^"]*)")?$/) do |borrower, params|
  # Creates a deed, with entered number of [borrowers].
  # Uses [params] to apply any overrides to the deed. e.g Change the name
  step %(I have valid deed data with <#{borrower}> borrowers)
  #Checks for optional deed params
  unless params.nil?
    step %(I override deed with "#{params}")
  end
  step %(I create the deed via the Deed API)
  step %(the deed id is returned by the Deed API)
  step %(I retrieve the unique user id for borrower <#{borrower}>)
end
