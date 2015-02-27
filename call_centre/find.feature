Feature: Find an appointment
  As a call centre agent
  I want to be able to find a customer’s appointment
  So that I can cancel, reschedule, or update the appointment

  Scenario: Search by reference number
    Given I am on the call centre home screen
    And There is an appointment with reference number '1'
    When I search for an appointment by <reference number>
    Then I should see <number of search results>

    Examples:
      | reference number | number of search results |
      | 1                | 1                        |
      | 666              | 0                        |
      | xxx              | 0                        |

  Scenario: Search by reference number and surname
    Given I am on the call centre home screen
    And There is an appointment with reference number '1' for customer with surname 'Smith'
    When I search for an appointment by <reference number> and <surname>
    Then I should see <number of search results>

    Examples:
      | reference number | surname | number of search results |
      | 1                | Smith   | 1                        |

  Scenario: Search by surname case insensitive
    Given I am on the call centre home screen
    And There is an appointment for customer with surname 'Smith'
    When I search for an appointment by <surname>
    Then I should see <number of search results>

    Examples:
      | surname | number of search results |
      | Smith   | 1                        |
      | smith   | 1                        |

  Scenario: Search by partial surname
    Given I am on the call centre home screen
    And There is an appointment for customer with surname <customer>
    When I search for an appointment by <surname>
    Then I should see <number of search results>

    Examples:
      | customer | surname | number of search results |
      | Smith    | Smi     | 1                        |
      | Smith    | ith     | 1                        |
      | Smith    | mit     | 1                        |

  Scenario: Search by email
  Scenario: Search by partial email
  Scenario: Search by surname and email
  Scenario: Search by surname and date
