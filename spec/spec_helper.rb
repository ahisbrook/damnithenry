lib_path = File.expand_path('../../lib', __FILE__)
require "#{lib_path}/apology_generator.rb"

RSpec.configure do |config|
  # Spec Filtering
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end