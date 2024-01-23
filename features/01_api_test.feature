@api @regression
Feature: As a user I want to confirm customer number

Scenario: Verify total number of customers
    Given user sends get request to retrieve customers in "application/json" format
    # Then status code should be 200
    # And content type is "application/json"
    # And total number of customer is 6
    # # And json response should be valid against schema for "/customers" endpoint