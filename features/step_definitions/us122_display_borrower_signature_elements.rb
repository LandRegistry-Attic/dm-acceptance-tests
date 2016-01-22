Then(/^<(\d+)> borrower signature element is on page/) do |sig_num|
  signature_id = 'signature' + sig_num
  find_by_id(signature_id)
end
