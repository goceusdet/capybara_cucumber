class LandingPare

    def search string
        find("//input[@id='q']").click #--> clicks on top search bar
        find("//input[@id='q']").set(string).send_keys(:enter) #--> .set = sendKeys in Java && send_keys = Keys Enum in Java.
    end

end