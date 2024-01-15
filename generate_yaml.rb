# generate_yaml.rb
# require 'yaml'
# require 'erb'

# yaml_content = <<~YAML
# default: --profile html_report
# html_report: --format html --out reports/<%= Time.now.strftime("%m-%d-%y_%H:%M") %>.html
# YAML

# # Save the generated YAML to a file
# File.write('config/cucumber.yaml', YAML.load(yaml_content).to_yaml) 