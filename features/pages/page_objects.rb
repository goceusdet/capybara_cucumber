# Here we instantiate all page classes so that later we can call them through Page instance instantiated in hooks.rb

class Page


    def landing_page
        LandingPage.new
    end

    def search_result_page
        SearchResultsPage.new
    end

end