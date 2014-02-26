require 'rails/generators/base'

class SpecHarnessGenerator < Rails::Generators::Base
  class_option :gems, type: :boolean, default: true, desc: "Add gems to Gemfile"
  class_option :guardfile, type: :boolean, default: true, desc: "Create a Guardfile"
  class_option :include_types, type: :array, default: [], desc: "Types of specs to specifically include"
  class_option :exclude_types, type: :array, default: [], desc: "Types of specs to specifically exclude"

  def generate_harness
    generate 'harness_spec_helper'
    required_spec_types.each do |type|
      generate "harness_spec_helper #{type}"
    end
    generate "harness_guardfile --watch_types=#{watch_types}" if options.guardfile?
    generate 'harness_gems' if options.gems?
  end

  private
  def spec_types
    [
      'actions',
      'decorators',
      'features',
      'forms',
      'models',
      'services'
    ]
  end

  def required_spec_types
    return options.include_types if options.include_types.any?
    spec_types - (options.exclude_types.map {|t| t.underscore.pluralize})
  end

  def watch_types
    required_spec_types.reject {|t| t == 'features'}.join(' ')
  end
end
