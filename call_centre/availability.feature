Feature: Pick appointment time
  As a call centre agent
  I want to pick an appointment time for the customer
  So that the customer knows when s/he will have a guidance session

  Scenario: First available time slot by default
    Given I start to book a new appointment
    When the availability calendar loads
    Then the first available time slot should be visible

  Scenario: Time slots available in the future
    Given I see the availability calendar
    Then Only slots available in the future should be visible

  Scenario: Navigate to the following week
    Given I see the availability calendar
    When I navigate forward
    Then I should see the following week

  Scenario: Navigate to the previous week
    Given I see the availability calendar
    When I navigate backward
    Then I should see the previous week

  Scenario: Pick slot to continue
    Given I see the availability calendar
    When I pick a time slot
    Then I should now be able to continue

  Scenario: Slot no longer available
    Given I have picked a time slot
    And another call centre agent has already reserved the same time slot
    When I try to reserve the slot by continuing
    Then I should be notified that the slot is no longer available

  Scenario: Selected time slot
    Given I have selected a time slot
    And I reserve the slot by continuing
    When I navigate backward
    Then I should see the relevant week with the selected time slot

  Scenario: Change selected time slot
    Given I have selected a time slot
    And I reserve the slot by continuing
    When I navigate backward
    And I select a different time slot
    And I reserve the slot by continuing
    When I navigate backward
    Then I should see the relevant week with the newly selected time slot
