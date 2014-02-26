require 'base_spec_helper'
require 'responsive_service'
Dir[File.join(RAILS_ROOT, "spec/support_<%= spec_type.underscore.pluralize %>/**/*.rb")].each {|f| require f}
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/<%= spec_type.underscore.pluralize %>"