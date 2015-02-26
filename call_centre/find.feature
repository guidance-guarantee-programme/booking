Feature: Find an appointment
  As a call centre agent
  I want to be able to find a customer’s appointment
  So that I can cancel or reschedule the appointment

  Scenario: Find an appointment
    Given I am on the home screen
    When I search with a customer’s details
    Then I should be able to see the customer’s appointment in the search results

  Scenario: Find an appointment with more than one field
    Given I have searched with one piece of information
    When I search with a second piece of information
    Then I should be able to see the customer’s appointment in a narrower selection of search results
