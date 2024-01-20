require_relative '../utils/environment'

Given('I get related environment information') do ||
    puts "Environment home page: #{Environment.get_home_page}"
    puts "Environment api base uri: #{Environment.get_api_base_uri}"
end