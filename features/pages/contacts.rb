#  require 'rspec'

class Contacts
    include BasePage # --> Include BasePage module to use Capybara methods
  
    def get_contact_page_title_string

        if  page.title.to_s != 'Contact | Stryker'
            @stryker_main_page.click_on_navigation_menu('Contacts')
            return page.title.to_s
        else
            return page.title.to_s
        end
   
    end

  end