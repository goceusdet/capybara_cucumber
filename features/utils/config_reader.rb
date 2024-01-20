require 'yaml'

class ConfigReader

    # method that reads from specified yml file:
    def self.get_property_per_filename(filename, key)
    
        # 'begin/rescue' is equivalent to try-catch in java.
        begin
            # filename represents the name of the yml file.
            case filename 
                when "qa1"
                    path = File.join(Dir.pwd, 'config', "/environments/#{filename.downcase}.yml")
                    config_data = YAML.load_file(path)
                when "cucumber"
                    path = File.join(Dir.pwd, 'config', "/#{filename.downcase}.yml")
                    config_data = YAML.load_file(path)
                else
                    puts "WARNING: No such filename!"
            end

             # Assuming the YAML structure is nested (e.g., config/environments/qa1.yml)
            keys = key.split(': ')
            value = config_data.dig(*keys)

            if value.nil?
                puts "WARNING: Property '#{key}' not found in #{filename.downcase}.yml"
            else
                value
            end

        rescue StandardError => e
            puts "ERROR: Failed to read #{filename.downcase}. #{e.message}"
        end
    
    end

    # method that reads from ALL yml files under config folder:
    def self.get_property(parameter)
        # 'begin/rescue' is equivalent to try-catch in java.

        begin
            # Loop through each YAML file
            yaml_files.each do |file_path|
                puts "Processing #{file_path}"
                    # Read and parse YAML file into a hash
                    @config = YAML.load_file(file_path)
                    # Check if the parameter matches any key in the current YAML file
                    if @config.key?(parameter)
                        return @config[parameter] # Return the value if found
                    end
                    
            end

        rescue StandardError => e
            puts "ERROR: Failed to read #{parameter}. Check if this key exists in the yml file. #{e.message}"
        end
                
    end

end