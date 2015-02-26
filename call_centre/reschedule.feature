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
