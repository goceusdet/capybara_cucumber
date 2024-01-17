require_relative '../pages/stryker_main_page' #--> by requiring this we get to get the instances later 

Given('I visit {string}') do |string|
    $stryker_page = StrykerMain.new #--> creating the instance
    # need method that takes us to the url
    $stryker_page.visit_url string
    #visit string
end
  

When('I search for {string}') do |string|
    
    $stryker_page.search_item(string)

    # find("//input[@id='q']").click #--> clicks on top search bar
    # find("//input[@id='q']").set(string).send_keys(:enter) #--> .set = sendKeys in Java && send_keys = Keys Enum in Java.

end


Then('I should see search results for {string}') do |string|
    #binding.pry

    puts actual_message = find("//div[@class='search-header']/h2").text

    expect(actual_message).to include(string) #--> .to include() method is like contains() method in Java
end