Feature: Cancel an appointment
  As a call centre agent
  I want to be able to cancel an appointment when a customer no longer needs it
  So that the slot is released for someone else to use

  Scenario: Cancel an appointment
    Given that I have found the customer’s booked appointment
    When I cancel the appointment
    Then I should be asked to confirm the cancellation

  Scenario: Confirm cancellation
    Given that I’ve been asked to confirm the cancellation
    When I confirm
    Then I should be able to choose whether to send the customer a cancellation email

  Scenario: Seeing a cancelled appointment
    Given that I have cancelled a customer’s appointment
    When I search for that appointment again
    Then I want to see that this appointment has been cancelled
