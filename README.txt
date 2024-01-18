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
            chrome_options.add_argument('--start-maximized')

            Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
            end

            Capybara.default_driver = :chrome

5. Automatically creates separate reports files with each session, stored in reports folder as html files.
    - run cmd: cucumber 

6. To run parallel[note: it will produce separate reports per each feature file]
    - ENABLE TO CTREATE REPORT FILE PER PARALLEL FEATURE:
        - embed ENV['TEST_ENV_NUMBER'] in 'parallel: --out' [see config.yml file]
        - run cmd: SET TEST_ENV_NUMBER=1 to set parallel as ENV variable.

    - CREATE combine_reports FILE TO STORE GENERATED HTML FILES AND COMBINE THEM BACK TO REPORTS FOLDER [see combine_reports.ps1 file]

    - RUN COMMAND : bundle exec parallel_cucumber -n (number of processes to run) "&" combine_reports.ps1

    - To specify number of processes/methods to run parallel assign number after '-n'.
