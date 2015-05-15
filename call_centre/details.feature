Feature: Customer details
  As a call centre agent
  I want to enter a customer's details
  So that a specialist can contact the customer

  Scenario: Required customer details
    Given I see the customer details form
    When I enter all the <required fields>
    And I enter either an email or an address
    Then I can continue

    Examples:
      | required fields   |
      | first name        |
      | last name         |
      | appointment phone |
      | memorable word    |

  Scenario: Required address if no email
    Given I see the customer details form
    When I enter all the <required fields>
    And I do not enter an email
    Then I should be notified that <address required>

    Examples:
      | required fields   | address required |
      | first name        | address line one |
      | last name         | town / city      |
      | appointment phone | postcode         |
      | memorable word    |                  |

  Scenario: Text only fields
    Given I see the customer details form
    When I enter <rubbish> to <text only fields>
    Then I should be notified of errors

    Examples:
      | rubbish | text only fields |
      | L1Z     | first name       |
      | 12345   | first name       |
      | !@£$!   | last name        |

  Scenario: Number only fields
    Given I see the customer details form
    When I enter <rubbish> to <number only fields>
    Then I should be notified of errors

    Examples:
      | rubbish | number only fields    |
      | C4LLME  | appointment phone     |
      | !@£$!   | appointment phone     |
      | whatevs | reminder mobile phone |

  Scenario: International phone numbers
    Given I see the customer details form
    When I want to enter an international phone number
    Then I should be able to select the country code

  Scenario: Default phone number country code
    Given I see the customer detail form
    Then The default country code for phone numbers should be UK (+44)

  Scenario: Enter UK phone number
    Given I see the customer details form
    When I enter a <phone number> with the default UK country code
    Then The <correct number> should appear in the customer's record
    And The <correct number> should appear in any emails sent to the customer

    Examples:
      | phone number | correct number |
      | 07460 123456 | +44 7460123456 |
      | 0207 1234567 | +44 2071234567 |

  Scenario: Enter international phone number
    Given I see the customer details form
    When I enter an <international phone number>
    Then The <correct number> should appear in the customer's record
    And The <correct number> should appear in any emails sent to the customer

    Examples:
      | international phone number | correct number |
      | +30 2101234567             | +30 2101234567 |
      | +1284 4943134              | +1284 4943134  |
      | +39 022136400              | +39 022136400  |
