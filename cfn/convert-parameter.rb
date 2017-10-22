require 'yaml'
require 'json'

yaml = YAML.load_file(ARGV[0])

result = []
yaml['Parameters'].each do |pa|
  val = pa[1]["Default"] || "Type #{pa[1]["Type"]}"
  
  result << {
    "ParameterKey" => pa[0],
    "ParameterValue" => val
  }
end

puts JSON.pretty_generate(result)
