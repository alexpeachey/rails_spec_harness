require 'base_spec_helper'
require 'active_record'
require 'rspec/rails/extensions/active_record/base'
require 'shoulda'
Dir[File.join(RAILS_ROOT, "spec/support_models/**/*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(
  YAML.load(File.read(RAILS_ROOT + '/config/database.yml'))['test']
)

ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/models"