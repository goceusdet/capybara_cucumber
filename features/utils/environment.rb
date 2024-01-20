require 'yaml'
require_relative 'config_reader'

class Environment

    # Equivalent of Java static block in Ruby
    class << self

        ENV['environment'] = nil
        if ENV['environment'] != nil
            @@environment = ENV['environment'] 
        else
            @@environment = ConfigReader.get_property_per_filename('cucumber', 'environment')
        end
        
            # environments yml files are found via this path:
            # Dir.pwd gets us the [absolute]path of the project.
            @@path = File.join(Dir.pwd, 'config', 'environments', "#{@@environment}.yml")

            def get_property_value(key)
                
                # java try-catch block equivalent:
                begin
                    File.open(@@path, 'r') do |file|
                        properties = {}
                        file.each_line do |line|
                            key, value = line.strip.split(': ')
                            properties[key] = value
                        end
                    end
                    
                rescue StandardError => e
                    puts "Error reading YAML file: #{e.message}"
                    nil
                end
            end

        # Environment content:
        def get_home_page
                ConfigReader.get_property_per_filename(@@environment, "home_page")
        end
        def get_contact_page_title
            ConfigReader.get_property_per_filename(@@environment, "contact_page_title")
        end
        def get_api_base_uri
            ConfigReader.get_property_per_filename(@@environment, "API.base.URI")
        end
        def get_dbURL
            ConfigReader.get_property_per_filename(@@environment, "dbURL")
        end
        def get_DB_username
            ConfigReader.get_property_per_filename(@@environment, 'dbUsername')
        end
        def get_DB_password
            ConfigReader.get_property_per_filename(@@environment, 'dbPassword')
        end

    end
        

end