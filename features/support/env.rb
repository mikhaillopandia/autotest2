Bundler.require(:default)
require 'capybara/dsl'
require_relative '../../pages/signin_page'

World(Capybara::DSL)

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://demoapp.strongqa.com'
