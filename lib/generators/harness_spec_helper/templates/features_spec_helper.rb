require 'base_spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'factory_girl'
require 'database_cleaner'
Dir[Rails.root.join('spec/support_features/**/*.rb')].each {|f| require f}

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

DatabaseCleaner.strategy = :truncation

Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
