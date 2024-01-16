# Stores capybara methods and include this module in page classes
module BasePage 

    include Capybara::DSL #--> Capybara::DSL  is a module in the Capybara testing framework for Ruby that provides a set of methods to interact with web pages and perform actions like clicking buttons, filling in forms, and checking content.Methods like  visit, click_button, fill_in, find and others.
    
    include Capybara::Node::Matchers #--> is a module in the Capybara testing framework for Ruby that provides a set of matchers to be used in conjunction with testing frameworks like RSpec. Matchers are typically used to assert conditions or expectations about the state of the page or elements on the page. FOr ex.: 
        # expect(page).to have_content(string) --Checks if the page contains the specified text.
        # expect(page).to have_css('selector') -- Checks if the page has an element that matches the given CSS selector.
        # expect(page).to have_selector('css_locator') -- Similar to have_css, checks for an element matching the given selector.
        # expect(page).to have_field('field_name', with: 'value') --  Checks if a form field has a specific value.
        # expect(page).to have_button('button_webelement_content') -- Checks if a button with the specified text exists on the page.
        # expect(page).to have_link('link_content') -- Checks if a link with the specified text exists on the page.
        # expect(page).to have_current_path('/path', ignore_query: true/false) -- Checks if the current URL path matches the specified path.

end