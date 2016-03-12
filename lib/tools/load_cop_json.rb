# load_cop_json.rb - method load_cop_json - loads JSON format result of running Rubocop

# Viper namespace
module Viper
  # Viper Packages namespace
  module Packages
    # ViperRubocop code for handling Rubocop static analyzer JSON files
    module ViperRubocop
      #Exception for missing JSON file 
      class RubocopJSONFileNotFound < RuntimeError
        def initialize path
          super "#{path} could not be found"
        end
      end
    end
  end
end

def load_cop_json buffer, path
  raise Viper::Packages::ViperRubocop::RubocopJSONNotFound.new path unless File.exist?(path)

  timestamp = File.mtime(path)
  buffer.ins "Rubocop analyzer results\n"
  buffer.ins timestamp.localtime.strftime("Time: %Y/%m/%d %H:%M\n")
  contents = File.read(path)
  loaded = JSON.load(contents)
  buffer.ins "Summary: offense count: #{loaded['summary']['offense_count']}\n"
  loaded['files'].reject { |e| e['offenses'].empty? }.each do |file|
    buffer.ins "F:#{file['path']}\n" 
    file['offenses'].each do |offense|
      buffer.ins "\t#{offense['message']}:L:#{offense['location']['line']}:C:#{offense['location']['column']}:#{offense['cop_name']}\n"
    end
  end

  buffer.beg
end

