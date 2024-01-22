@regression @ui
Feature: Contacts
    As a user, I want to go to contact page so that I can easily contact stryker representative.

Scenario: Veryfy user can go to contact page
    Given I visit "home_page"
    When user clicks on "contact" tab
    Then user should be directed to "Contact | Stryker" page
