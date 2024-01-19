require_relative 'features/utils/environment'
require_relative 'features/utils/config_reader'

class Test

    puts Environment::HOMEPAGE
    puts Dir.pwd
    p ConfigReader.get_property('cucumber', 'browser')

end