# load_cop_json.rb - method load_cop_json - loads JSON format result of running Rubocop

def load_cop_json buffer, path
  buffer.ins "Rubocop analyzer results\n"
  contents = File.read(path)
  loaded = JSON.load(contents)
  loaded['files'].each do |file|
    buffer.ins "#{file['path']}\n" 
    file['offenses'].each do |offense|
      buffer.ins offense.inspect
      buffer.ins "\n"
    end
  end
end

