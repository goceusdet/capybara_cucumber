require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'yaml'
require 'erb'
require 'rspec'
require_relative '../pages/base_page'
require 'parallel_tests'
require 'report_builder'

class Driver
    include Singleton
    include BasePage
    # include Capybara

    def get_driver
        # Load configuration from config.yml,
        # $cuckes_config = YAML.load_file('config/cucumber.yml')
        # Set the browser type from the configuration:
        # browser_type = $cuckes_config['browser'].to_sym
        browser_type = ConfigReader.get_property_per_filename('cucumber', 'browser').to_sym

        Capybara.register_driver :get_driver do |app|

            case browser_type

                when :chrome
                chrome_options = Selenium::WebDriver::Chrome::Options.new
                #chrome_options.add_argument("--window-size=1920,1080")
                chrome_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: browser_type, options: chrome_options)

                when :headless_chrome
                chrome_options = Selenium::WebDriver::Chrome::Options.new
                #chrome_options.add_argument("--window-size=1920,1080")
                chrome_options.add_argument('--headless')
                chrome_options.add_argument("--window-size=1920,1080")
                # chrome_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)

                when :firefox
                firefox_options = Selenium::WebDriver::Firefox::Options.new
                #firefox_options.add_argument("--window-size=1920,1080")
                firefox_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: browser_type, options: firefox_options)

                when :headless_firefox
                firefox_options = Selenium::WebDriver::Firefox::Options.new
                firefox_options.add_argument('--headless')
                # chrome_options.add_argument("--window-size=1920,1080")
                chrome_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: :firefox, options: firefox_options)

                when :edge
                edge_options = Selenium::WebDriver::Edge::Options.new
                edge_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: browser_type, options: edge_options)

                when :headless_edge
                edge_options = Selenium::WebDriver::Edge::Options.new
                edge_options.add_argument('--headless')
                edge_options.add_argument("--window-size=1920,1080")
                # edge_options.add_argument('--start-maximized')
                Capybara::Selenium::Driver.new(app, browser: :edge, options: edge_options)

                else
                raise "Unsupported browser type: #{browser_type}"

            end

        end

        Capybara.default_driver = :get_driver
        Capybara.default_selector = :xpath #--> setting this up so that we won't have to specify locator type everytime we locate a webelement. 

    end
end