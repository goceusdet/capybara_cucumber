Feature: Search orthopedics

Scenario: As a user I should be able to search for orthopedics and get matching results
    Given I visit "https://www.stryker.com/us/en/index.html"
    When I search for "orthopedics"
    Then I should see search results for "orthopedics"