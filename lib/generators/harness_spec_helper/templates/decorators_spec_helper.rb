require 'base_spec_helper'
require 'response_state'
require 'draper'
Draper::ViewContext.test_strategy :fast
Dir[File.join(RAILS_ROOT, 'spec/support_decorators/**/*.rb')].each { |f| require f }
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/decorators"
