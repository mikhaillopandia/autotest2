Bundler.require(:default)
require 'capybara/rspec'
require_relative '../lib/signin'
require 'capybara/dsl'
include Capybara::DSL

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
  config.expose_dsl_globally = true
end

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://demoapp.strongqa.com'