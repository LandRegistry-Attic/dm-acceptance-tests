################################################################################
### This file contains the global variables for the various endpoints used   ###
### in acceptance tests, this abstracts the urls so that you will not        ###
### need to change every test when switching environments for example.       ###
################################################################################

### Class holding environment variables for digital mortgage APIs and Frontends
class Env
  def self.deed_api
    (ENV['DEED_API_URL'] ||
        'http://0.0.0.0:9020')
  end

  def self.borrower_frontend
    (ENV['BORROWER_FRONTEND_URL'] ||
        'http://10.10.10.10:9030')
  end
end
