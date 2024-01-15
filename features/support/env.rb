require 'capybara/cucumber'
require 'selenium/webdriver'
require 'pry'
require 'yaml'
require 'erb'
require 'rspec'

chrome_options = Selenium::WebDriver::Chrome::Options.new
chrome_options.add_argument("--window-size=1920,1080")

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
end

Capybara.default_driver = :chrome
Capybara.default_selector = :xpath #--> setting this up so that we won't have to specify everytime we locate a webelement. 

