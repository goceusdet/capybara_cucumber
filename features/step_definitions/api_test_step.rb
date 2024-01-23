require_relative '../utils/api_base'

Given('user sends get request to retrieve customers in {string} format') do |endpoint|
    ApiBase.get_customers(endpoint)
end

# When('user sent get request to {string} endpoint') do |string|
#   // Write code here that turns the phrase above into concrete actions
# end

# Then('total number of customer is {int}') do |int|
#   // Write code here that turns the phrase above into concrete actions
# end

# Then('content type is {string}') do |string|
#   // Write code here that turns the phrase above into concrete actions
# end

# Then('status code should be {int}') do |int|
#   // Write code here that turns the phrase above into concrete actions
# end

