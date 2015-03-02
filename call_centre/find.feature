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

  Scenario: Search by full email
    Given I am on the call centre home screen
    And there is an appointment for customer with email <email>
    When I search for an appointment by <email>
    Then I should see <number of search results>
  
  Examples:
    | email               | number of search results |
    | j.smith@example.com | 1                        |
    | j.bloggs@123.com    | 1                        |
  
  
  Scenario: Search by partial email
    Given I am on the call centre home screen
    And there is an appointment for customer with email <customer>
    When I search for an appointment by <email>
    Then I should see <number of search results>
    
  Examples:
    | customer              | email      | number of search results |
    | j.smith@example.com   | ith@examp  | 1                        |
    | j.bloggs@123.com      | j.bloggs@  | 1                        |
  
  
  Scenario: Search by surname and email
    Given I am on the call centre home screen
    And there is an appointment for customer with surname <customer> and email <email>
    When I search for appointment by <surname> and <email>
    Then I should see <number of search results>
    
  Examples:
    | customer | email               | number of search results |
    | Smith    | j.smith@example.com | 1                        |
    | Bloggs   | j.bloggs@123.com    | 1                        |
  
  Scenario: Search by surname and date
    Given I am on the call centre home screen
    And there is an appointment for customer with surname <customer> at date <date>
    When I search for an appointment by <surname> and <date>
    Then I should see <number of search results>
    
  Examples:
    | customer | date          | number of search results |
    | Smith    | 2 March 2015  | 1                        |
    | Bloggs   | 16 April 2015 | 1                        |
  
   Scenario: Search by surname and date range
    Given I am on the call centre home screen
    And there is an appointment for customer with surname <customer> at date range <date range>
    When I search for an appointment by <surname> and <date range>
    Then I should see <number of search results>
  
    Examples:
    | customer | date range    | number of search results |
    | Smith    | last 2 weeks  | 1                        |
    | Bloggs   | last 4 weeks  | 1                        |
  
