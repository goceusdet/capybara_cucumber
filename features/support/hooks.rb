require_relative '../pages/page_objects'

Before do |scenario|
    $page = Page.new #--> instantiating Page class so that through this instance we can call other pages instantiated in page_objects.rb file and their methods.
end