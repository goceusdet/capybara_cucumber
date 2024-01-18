class StrykerMain
include BasePage #--> we include BasePage module to use capybara methods

    def visit_url(page)
        # laod correct yml file:
        $qa1_config = YAML.load_file('config/environments/qa1.yml')
        visit $qa1_config[page]
    end

    def search_item(item_name)
        # fill_in method takes field 'name' or 'label' value and what we want to fill it in with.
        (fill_in 'q', with: item_name).send_keys(:enter)

            # find("//input[@id='q']").click #--> clicks on top search bar
            # find("//input[@id='q']").set(item_name).send_keys(:enter) #--> .set = sendKeys in Java && send_keys = Keys Enum in Java.
    end

    def click_on_navigation_menu(navigation_menu_name)
        find("//a/span[.='"+navigation_menu_name.capitalize+"']").click
    end

end