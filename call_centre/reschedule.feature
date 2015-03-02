Feature: Reschedule an appointment
  As a call centre agent
  I want to be able to reschedule a customer’s appointment
  So that the customer is able to have their guidance session at a different time

  Scenario: Choosing to reschedule an appointment
    Given that I have found the customer’s booked appointment
    When I choose to reschedule the appointment
    Then I want to see the availability calendar

  Scenario: Pick new appointment time
    Given I see the availability calendar
    When I pick a time slot
    Then I should be able to confirm the new time

  Scenario: Reschedule a cancelled appointment
    Given I have found a customer's cancelled appointment
    When I see the customer's details
    Then I should not be able to reschedule the appointment
  
  Scenario: Reschedule an appointment in the past
    Given I have found a customer's appointment
    When I choose to reschedule this appointment
    And when I see the availability calendar
    Then I should not be able to choose a time slot in the past
  
  Scenario: Reschedule an appointment earlier than originally booked
    Given I have found a customer's appointment
    When I choose to reschedule this appointment
    And when I see the availability calendar
    Then I should be able to choose an earlier time slot which still has a minimum 2 week waiting time
