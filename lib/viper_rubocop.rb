# viper_rubocop.rb - requires for viper_rubocop Viper package

require_relative 'viper_rubocop/version'
require_relative 'tools'




# Add command load_cop_json to Viper commands
Viper::Session[:commands][:load_cop_json] = ->(b, *args) { load_cop_json(b, args[0]); say "Rubocop JSON #{args[0]} loaded" }