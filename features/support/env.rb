################################################################################
### This file contains the global variables for the various endpoints used   ###
### in acceptance tests, this abstracts the urls so that you will not        ###
### need to change every test when switching environments for example.       ###
################################################################################

### Class holding environment variables for digital mortgage APIs and Frontends
class Env
  def self.deed_api
    (ENV['DEED_API_URL'] ||
        'http://localhost:5000')
  end
end
