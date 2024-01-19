require 'yaml'

class ConfigReader

    def self.get_property(filename, key)
    
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
                puts "WARNING: Property '#{key}' not found in #{filename.downcase}."
            else
                value
            end

        rescue StandardError => e
            puts "ERROR: Failed to read #{filename.downcase}. #{e.message}"
        end
    
    end

end