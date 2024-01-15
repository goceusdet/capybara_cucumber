# Stores capybara methods and include this module in page classes
module BasePage
    include Capybara::DSL
    include Capybara::Node::Matchers
end