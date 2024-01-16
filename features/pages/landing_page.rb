class LandingPage
    include BasePage#--> including BasePage in order for Landing page to recognize capybara methods

        def search string
            find("//input[@id='q']").click #--> clicks on top search bar
            find("//input[@id='q']").set(string).send_keys(:enter) #--> .set = sendKeys in Java && send_keys = Keys Enum in Java.
        end

end