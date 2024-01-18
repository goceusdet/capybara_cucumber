@regression
Feature: Search orthopedics

Scenario: As a user I should be able to search for orthopedics and get matching results
    Given I visit "home_page"
    When I search for "orthopedics"
    Then I should see search results for "orthopedics"