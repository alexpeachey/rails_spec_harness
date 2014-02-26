require 'rails/generators/base'

class HarnessGuardfileGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  class_option :watch_types, type: :array, default: [], required: true, desc: "Types of specs to watch"

  def generate_guardfile
    template 'Guardfile', 'Guardfile'
  end

  private
  def spec_paths
    options.watch_types.map { |t| "spec/#{t}" }
  end

  def spec_type_matcher
    options.watch_types.join('|')
  end
end
