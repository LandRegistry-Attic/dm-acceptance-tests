################################################################################
### This file contains details of any setup of libraries/gems and such that  ###
### will be needed for creating and running the acceptance tests.            ###
################################################################################

require 'capybara/cucumber'
require 'capybara/poltergeist'

include Capybara::DSL
Capybara.default_selector = :xpath
Capybara.default_wait_time = 10
Capybara.app_host = 'http://localhost:4567'

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true, js_errors: true)
end

require 'test/unit'
include Test::Unit::Assertions

require 'rspec'

require 'pxeger'

require 'http'

#require 'pg_json'

require 'pg'
