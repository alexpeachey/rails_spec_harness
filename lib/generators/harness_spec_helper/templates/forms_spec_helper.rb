require 'base_spec_helper'
require 'responsive_service'
require 'fob'
Dir[File.join(RAILS_ROOT, "spec/support_forms/**/*.rb")].each {|f| require f}
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/forms"