ENV['RAILS_ENV'] ||= 'test'
require 'rubygems'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
  SimpleCov.start 'rails'
end

RAILS_ROOT = File.expand_path('../..', __FILE__)
require 'rspec/autorun'

Dir[File.join(RAILS_ROOT, 'spec/support/**/*.rb')].each { |f| require f }
RSpec.configure do |config|
  config.mock_with :rspec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

require 'active_support'
require 'active_support/dependencies'
require 'extend_attr_defaultable'
I18n.enforce_available_locales = false
I18n.load_path = Dir[File.join(RAILS_ROOT, 'config/locales/*.yml'), File.join(RAILS_ROOT, 'config/locals/*.rb')]
