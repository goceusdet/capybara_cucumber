require_relative '../pages/stryker_main_page'#--> by requiring this we get to get the instances later 

When('user clicks on {string} tab') do |tab_name|
    $stryker_page.click_on_navigation_menu tab_name
end
  
Then('user should be directed to {string} page') do |expected_page_title|
    @contacts_page = Contacts.new
    
    puts "Title is: #{@contacts_page.get_contact_page_title_string}"

    expect(@contacts_page.get_contact_page_title_string).to eq(expected_page_title)
end