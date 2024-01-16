require 'capybara/cucumber'
require 'selenium/webdriver'
require 'pry'
require 'yaml'
require 'erb'
require 'rspec'
require_relative '../pages/base_page'


# High level instantiation
chrome_options = Selenium::WebDriver::Chrome::Options.new
#chrome_options.add_argument("--window-size=1920,1080")
chrome_options.add_argument('--start-maximized')

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
end

Capybara.default_driver = :chrome
Capybara.default_selector = :xpath #--> setting this up so that we won't have to specify locator type everytime we locate a webelement. 

