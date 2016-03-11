# load_cop_json.rb - method load_cop_json - loads JSON format result of running Rubocop

def load_cop_json buffer, path
  buffer.ins "Rubocop analyzer results\n"
  contents = File.read(path)
  loaded = JSON.load(contents)
  loaded['files'].reject { |e| e['offenses'].empty? }.each do |file|
    buffer.ins "F:#{file['path']}\n" 
    file['offenses'].each do |offense|
      buffer.ins "\t#{offense['message']}:L:#{offense['location']['line']}:C:#{offense['location']['column']}:#{offense['cop_name']}\n"
    end
  end

  buffer.beg
end

