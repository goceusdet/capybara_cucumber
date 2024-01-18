require 'yaml'

class Environment

    $config_cucks=YAML.load_file('config/cucumber.yml')
    # Equivalent of Java static block in Ruby
    class << self

        ENV['environment'] = nil
        #environment = ENV['environment'] || $config_cucks['environment']
        if ENV['environment'] != nil
            environment = ENV['environment'] 
        else
            environment = $config_cucks['environment']
        end

        # java try-catch block equivalent:
        begin
        # qa1.yml file is found via this path:
        # Dir.pwd gets us the [absolute]path of the project.
        path = File.join(Dir.pwd, 'config', 'environments', "#{environment}.yml")

        File.open(path, 'r') do |file|
            $properties = {}
                file.each_line do |line|
                    key, value = line.strip.split(': ')
                    $properties[key] = value
                end
            end
        end
    end
        HOMEPAGE = $properties['home_page']
        BASEURL = $properties['API.base.URI']
        DATABASEURL = $properties['dbURL']
end