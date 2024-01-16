Given('I visit {string}') do |string|
    visit string
end
  

When('I search for {string}') do |string|
    
    # find("//input[@id='q']").click #--> clicks on top search bar
    # find("//input[@id='q']").set(string).send_keys(:enter) #--> .set = sendKeys in Java && send_keys = Keys Enum in Java.
 
    $page.landing_page.search string

end


Then('I should see search results for {string}') do |string|
    #binding.pry

    puts actual_message = find("//div[@class='search-header']/h2").text

    expect(actual_message).to include(string) #--> .to include() method is like contains() method in Java
end