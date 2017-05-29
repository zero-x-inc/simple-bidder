ENV['RACK_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
    #DatabaseCleaner.clean_with(:truncation)
    #load './db/seeds.rb'
  end
end
