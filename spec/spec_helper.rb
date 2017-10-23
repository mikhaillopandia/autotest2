Bundler.require(:default)
require 'capybara/rspec'
require 'turnip/capybara'
require_relative '../lib/signin'
require 'capybara/dsl'
include Capybara::DSL

Dir.glob(File.expand_path("acceptance/steps/*steps.rb", File.dirname(__FILE__))) { |f| require f }

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