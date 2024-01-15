1. Create Gemfile (no extentions):
            source 'https://rubygems.org'
            gem 'cucumber'
            gem 'selenium-webdriver'
            gem 'capybara', '~>3.30'

         Run cmd: bundle install

2. Download chromedriver, version coresponding to your browser version.

3. Run cmd 'cucumber --init' to create basic cucumber structure.
     - under features/support we got env.rb file. it is where everything starts from.

4. To run on specified browser we need the capybara browser capabilities to be placed in the env.rb file:
    - google 'capybara [browser name] capabilities':
        -   chrome_options = Selenium::WebDriver::Chrome::Options.new
            chrome_options.add_argument("--window-size=1920,1080")

            Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
            end

            Capybara.default_driver = :chrome

5.
