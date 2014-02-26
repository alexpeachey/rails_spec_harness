require 'rails/generators/base'

class HarnessSpecHelperGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :spec_type, type: :string, default: 'base'

  def generate_spec_helper
    copy_file 'base_spec_helper.rb', 'spec/base_spec_helper.rb'
    copy_file 'dotrspec', '.rspec'
    create_file 'spec/support_common/.keep'
  end

  def generate_spec_helpers
    return if spec_type == 'base'
    template template_file, "spec/#{spec_type.underscore.pluralize}_spec_helper.rb"
    create_file "spec/support_#{spec_type.underscore.pluralize}/.keep"
    create_file "spec/#{spec_type.underscore.pluralize}/.keep"
    create_file "app/#{spec_type.underscore.pluralize}/.keep" unless spec_type.underscore.pluralize == 'features'
  end

  private
  def template_map
    {
      'decorators' => 'decorators_spec_helper.rb',
      'features' => 'features_spec_helper.rb',
      'forms' => 'forms_spec_helper.rb',
      'modles' => 'models_spec_helper.rb'
    }
  end

  def template_file
    template_map.fetch(spec_type.underscore.pluralize) { 'light_spec_helper.rb' }
  end
end
