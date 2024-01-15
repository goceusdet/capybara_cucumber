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
        - Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app,
                :browser => :chrome,
                :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOptions' => {
                    'args' => [ "--window-size=1920,1080" ]
                }
                )
            )
            end

5.
