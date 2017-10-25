Bundler.require(:default)
World(Capybara::DSL)
World(Capybara::RSpecMatchers)

require_relative '../pages/signin'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://demoapp.strongqa.com'
