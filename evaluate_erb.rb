require 'yaml'
require 'erb'

# Load the YAML file
yaml_content = File.read('config/cucumber.yml')

# Use ERB to evaluate embedded Ruby code
erb_result = ERB.new(yaml_content).result

# Parse the YAML with the evaluated ERB code
config = YAML.safe_load(erb_result)

# Access values
puts config['parallel']
puts config['html_parallel_report']