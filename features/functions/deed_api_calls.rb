def create_deed(deed_hash)
  response = HTTP.post(Env.deed_api + '/deed/', json: deed_hash)
  if response.code == 201
    response
  else
    fail "Error: Couldn't create deed #{deed_hash}, "\
          "received response #{response.code}"
  end
end
