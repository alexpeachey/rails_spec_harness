require 'rails/generators'
require 'rails/generators/base'

class HarnessGemsGenerator < Rails::Generators::Base
  def update_gemfile
    gem 'draper'
    gem 'fob'
    gem 'response_state'
    gem 'attr_defaultable', require: 'extend_attr_defaultable'
    gem_group :test do
      gem 'rspec-rails'
      gem 'shoulda'
      gem 'capybara'
      gem 'poltergeist'
      gem 'factory_girl_rails'
      gem 'database_cleaner'
      gem 'simplecov'
      gem 'simplecov-html'
      gem 'guard'
      gem 'guard-rspec'
      gem 'rb-inotify', require: false
      gem 'rb-fsevent', require: false
      gem 'rb-fchange', require: false
    end
  end
end
