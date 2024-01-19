require 'yaml'
require_relative 'config_reader'

class Environment

    # Equivalent of Java static block in Ruby
    class << self

        ENV['environment'] = nil
        if ENV['environment'] != nil
            environment = ENV['environment'] 
        else
            environment = ConfigReader.get_property('cucumber', 'environment')
        end

        # java try-catch block equivalent:
        begin
        # qa1.yml file is found via this path:
        # Dir.pwd gets us the [absolute]path of the project.
        @@path = File.join(Dir.pwd, 'config', 'environments', "#{environment}.yml")

        def get_property_value(key)
            File.open(@@path, 'r') do |file|
                properties = {}
                    file.each_line do |line|
                        key, value = line.strip.split(': ')
                        properties[key] = value
                    end
                end
            end
        end
    end
        HOMEPAGE = get_property_value('home_page')
        BASEURL = get_property_value('API.base.URI')
        DATABASEURL = get_property_value('dbURL')
end