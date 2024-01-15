Given('I visit {string}') do |string|
    visit string
end
  

When('I search for {string}') do |string|
    sleep 3
    find("//input[@id='q']").click #--> clicks on top search bar
    find("//input[@id='q']").set(string).send_keys(:enter) #--> .set = sendKeys in Java.

end


Then('I should see search results for {string}') do |string|
    #binding.pry

    puts actual_message = find("//div[@class='search-header']/h2").text

    puts expected_message = "Showing results for: orthopedics"

    expect(actual_message == expected_message)
end