require_relative 'driver'

# Capybara with the singleton driver instance
Before do |scenario|
  scenario.source_tag_names << '@ui and @regression'
  @driver_instance = Driver.instance
  @driver_instance.get_driver
  @driver = @driver_instance
end

# Clean up any state or perform actions after each scenario
After do |scenario|
  scenario.source_tag_names << '@ui and @regression'
  if scenario.failed?
    # The `screenshot` method is available if you are using the Selenium driver
      screenshot_path = "reports/screenshots/#{scenario.name}_failed.png"
      page.save_screenshot(screenshot_path)
      puts "Screenshot saved at: #{screenshot_path}"
  end
  Capybara.current_session.driver.quit
end