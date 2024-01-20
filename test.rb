require_relative 'features/utils/environment'
require_relative 'features/utils/excel_utils'


class Test
    # p Environment.get_property_value('home_page')
    # p Environment.get_dbURL
    # p Environment.get_api_base_uri
    # p Environment.get_home_page
    # p Environment.get_contact_page_title
    # puts Dir.pwd
    # puts ConfigReader.get_property_per_filename('cucumber', 'invalid')
    # p ConfigReader.get_property('browser')
    # puts ConfigReader.get_property('')
     excel_utils = ExcelUtils.new('C:\Users\MTRPE\OneDrive\Desktop\Capybara_Cucumber\resources\test_data\PagesInfoRuby.xlsx')
    puts excel_utils.get_cell_data(7, 2)


end